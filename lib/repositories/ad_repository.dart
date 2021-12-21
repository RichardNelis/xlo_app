import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_app/models/ad_model.dart';
import 'package:xlo_app/models/category_model.dart';
import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/parse_errors.dart';
import 'package:xlo_app/repositories/table_keys.dart';
import 'package:xlo_app/stores/filter_store.dart';
import 'package:path/path.dart' as path;
import 'package:xlo_app/utils/constants.dart';

class AdRepository {
  Future<void> sold(AdModel ad) async {
    try {
      final parseObject = ParseObject(keyAdTable)..set(keyAdId, ad.id);

      parseObject.set(keyAdStatus, AdStatus.sold.index);

      final response = await parseObject.save();

      if (!response.success) {
        return _customParseError(response);
      }
    } catch (e) {
      return Future.error("Falha ao salvar anúncio");
    }
  }

  Future<void> delete(AdModel ad) async {
    try {
      final parseObject = ParseObject(keyAdTable)..set(keyAdId, ad.id);

      parseObject.set(keyAdStatus, AdStatus.deleted.index);

      final response = await parseObject.save();

      if (!response.success) {
        return _customParseError(response);
      }
    } catch (e) {
      return Future.error("Falha ao salvar anúncio");
    }
  }

  Future<AdModel?> save(AdModel adModel) async {
    try {
      final parseImages = await saveImages(adModel.images);

      final parseUser = ParseUser(null, null, null)
        ..set(keyUserId, adModel.userModel.id);

      final parseObject = ParseObject(keyAdTable);

      final parseACL = ParseACL(owner: parseUser)
        ..setPublicReadAccess(allowed: true) //User pode escrever
        ..setPublicWriteAccess(allowed: false); //Todos podem ler

      parseObject.setACL(parseACL);

      //Atribuindo os valores ao objeto(Anúncio)
      if (adModel.id != null) {
        parseObject.set<String>(keyAdId, adModel.id!);
      }

      parseObject.set<String>(keyAdTitle, adModel.title);
      parseObject.set<String>(keyAdDescription, adModel.description);
      parseObject.set<bool>(keyAdHidePhone, adModel.hidePhone);
      parseObject.set<double>(keyAdPrice, adModel.price);
      parseObject.set<int>(keyAdStatus, adModel.status!.index);
      parseObject.set<int>(keyAdViews, adModel.views!);

      //Endereço
      parseObject.set<String>(keyAdDistrict, adModel.address.district);
      parseObject.set<String>(keyAdCity, adModel.address.cityModel.name);
      parseObject.set<String>(
          keyAdFederativeUnit, adModel.address.ufModel.initials);
      parseObject.set<String>(keyAdPostalCode, adModel.address.cep);

      //Imagens
      parseObject.set<List<ParseFile>>(keyAdImages, parseImages);

      //Vínculo com o usuario
      parseObject.set<ParseUser>(keyAdOwner, parseUser);

      //Vínculo com a categoria
      parseObject.set<ParseObject>(
        keyAdCategory,
        ParseObject(keyCategoryTable)..set(keyCategoryId, adModel.category.id),
      );

      final response = await parseObject.save();

      if (response.success) {
        adModel.id = parseObject.objectId;
        return adModel;
      } else {
        return _customParseError(response);
      }
    } catch (e) {
      return Future.error("Falha ao salvar anúncio");
    }
  }

  _customParseError(ParseResponse response) {
    return Future.error(ParseErrors.getDescription(response.error!.code)!);
  }

  Future<List<ParseFile>> saveImages(List images) async {
    final parseImages = <ParseFile>[];

    try {
      for (final image in images) {
        if (image is File) {
          final parseFile = ParseFile(image, name: path.basename(image.path));
          final response = await parseFile.save();

          if (!response.success) {
            Future.error(ParseErrors.getDescription(response.error!.code)!);
          } else {
            parseImages.add(parseFile);
          }
        } else {
          final parseFile = ParseFile(File(""));

          parseFile.name = path.basename(image);
          parseFile.url = image;
          parseImages.add(parseFile);
        }
      }
    } catch (e) {
      throw "Falha ao salvar imagens";
    }

    return parseImages;
  }

  Future<List<AdModel>> getHomeAdList({
    FilterStore? filter,
    required String search,
    CategoryModel? category,
    required int page,
  }) async {
    try {
      int qntItensPage = itemCountPage;

      final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));

      queryBuilder.includeObject([keyAdOwner, keyAdCategory]);

      queryBuilder.setAmountToSkip(page * qntItensPage);
      queryBuilder.setLimit(qntItensPage);

      queryBuilder.whereEqualTo(
          keyAdStatus, AdStatus.active.index); // Anuncios ativos

      if (search.isNotEmpty) {
        queryBuilder.whereContains(keyAdTitle, search.trim(),
            caseSensitive: false);
      }

      if (category != null && category.id != '*') {
        queryBuilder.whereEqualTo(
          keyAdCategory,
          (ParseObject(keyCategoryTable)..set(keyCategoryId, category.id))
              .toPointer(),
        );
      }

      if (filter != null) {
        //OrderBy
        switch (filter.orderBy) {
          case OrderBy.price:
            queryBuilder.orderByAscending(keyAdPrice);
            break;
          case OrderBy.date:
            queryBuilder.orderByDescending(keyAdCreatedAt);
            break;
          default:
            queryBuilder.orderByDescending(keyAdCreatedAt);
            break;
        }

        //Price
        if (filter.minPrice != null && filter.minPrice! > 0) {
          queryBuilder.whereGreaterThanOrEqualsTo(keyAdPrice, filter.minPrice);
        }

        if (filter.maxPrice != null && filter.maxPrice! > 0) {
          queryBuilder.whereLessThanOrEqualTo(keyAdPrice, filter.maxPrice);
        }

        //VendorType
        if (filter.vendorType != null &&
            filter.vendorType! > 0 &&
            filter.vendorType! <
                (vendorTypeProfessional | vendorTypeParticular)) {
          final userQuery = QueryBuilder(ParseUser.forQuery());

          if (filter.vendorType == vendorTypeParticular) {
            userQuery.whereEqualTo(keyUserType, UserType.particular.index);
          } else if (filter.vendorType == vendorTypeProfessional) {
            userQuery.whereEqualTo(keyUserType, UserType.profissional.index);
          }

          queryBuilder.whereMatchesQuery(keyAdOwner, userQuery);
        }
      }

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        return response.results!.map((e) => AdModel.fromParse(e)).toList();
      } else if (response.success && response.results == null) {
        return [];
      } else {
        return _customParseError(response);
      }
    } catch (e) {
      throw Future.error("Falha ao retornar os anúncios");
    }
  }

  Future<List<AdModel>> getMyAds({required UserModel user}) async {
    try {
      final currentUser = ParseUser('', '', '')..set(keyUserId, user.id);

      final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));

      queryBuilder.setLimit(100);
      queryBuilder.orderByDescending(keyAdCreatedAt);
      queryBuilder.whereEqualTo(keyAdOwner, currentUser.toPointer());
      queryBuilder.includeObject([keyAdCategory, keyAdOwner]);

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        return response.results!.map((e) => AdModel.fromParse(e)).toList();
      } else if (response.success && response.results == null) {
        return [];
      } else {
        return _customParseError(response);
      }
    } catch (e) {
      throw Future.error("Falha ao retornar os anúncios");
    }
  }
}
