import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_app/models/ad_model.dart';
import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/table_keys.dart';

import 'parse_errors.dart';

class FavoriteRepository {
  Future<void> save(
      {required AdModel adModel, required UserModel userModel}) async {
    final favoriteObject = ParseObject(keyFavoritesTable);

    favoriteObject.set<String>(keyFavoritesOwner, userModel.id!);

    //ForeingKEY
    favoriteObject.set<ParseObject>(
      keyFavoritesAd,
      ParseObject(keyAdTable)..set<String>(keyAdId, adModel.id!),
    );

    final response = await favoriteObject.save();

    if (!response.success) {
      return _customParseError(response);
    }
  }

  _customParseError(ParseResponse response) {
    return Future.error(ParseErrors.getDescription(response.error!.code)!);
  }

  Future<void> delete(
      {required AdModel adModel, required UserModel userModel}) async {
    try {
      final queryBuilder =
          QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));

      queryBuilder.whereEqualTo(keyFavoritesOwner, userModel.id!);
      queryBuilder.whereEqualTo(
        keyFavoritesAd,
        ParseObject(keyAdTable)..set<String>(keyAdId, adModel.id!),
      );

      final response = await queryBuilder.query();

      if (response.success && response.result != null) {
        for (var favorite in response.results! as List<ParseObject>) {
          await favorite.delete();
        }
      } else {
        return _customParseError(response);
      }
    } catch (e) {
      Future.error("Falha ao remover favorite");
    }
  }

  Future<List<AdModel>> getFavorites(UserModel userModel) async {
    try {
      String pointerAdUser = ("$keyAdTable.$keyAdOwner").toLowerCase();
      String pointerAdCategory = ("$keyAdTable.$keyAdCategory").toLowerCase();

      final queryBuilder = QueryBuilder<ParseObject>(
        ParseObject(keyFavoritesTable),
      );

      queryBuilder.whereEqualTo(keyFavoritesOwner, userModel.id!);

      queryBuilder.includeObject(
        [keyFavoritesAd, pointerAdUser, pointerAdCategory],
      );

      final response = await queryBuilder.query();

      if (response.success && response.result != null) {
        return response.results!
            .map(
              (e) => AdModel.fromParse(e.get(keyFavoritesAd)),
            )
            .toList();
      } else if (response.success && response.results == null) {
        return [];
      } else {
        return _customParseError(response);
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
