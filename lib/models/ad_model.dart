import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_app/models/address_model.dart';
import 'package:xlo_app/models/city_model.dart';
import 'package:xlo_app/models/uf_model.dart';
import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/table_keys.dart';

import 'category_model.dart';

enum AdStatus { pending, active, sold, deleted }

class AdModel {
  String? id;
  List images;
  String title;
  String description;
  CategoryModel category;
  AddressModel address;
  double price;
  bool hidePhone;
  AdStatus? status;
  DateTime? created;
  UserModel userModel;
  int? views;

  AdModel({
    this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.category,
    required this.address,
    required this.price,
    required this.hidePhone,
    this.status,
    this.created,
    required this.userModel,
    this.views,
  }) {
    status = status ?? AdStatus.pending;
    views = views ?? 0;
  }

  AdModel.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        title = parseObject.get(keyAdTitle),
        description = parseObject.get(keyAdDescription),
        price = (parseObject.get(keyAdPrice))!.toDouble(),
        status = AdStatus.values[parseObject.get(keyAdStatus)],
        hidePhone = parseObject.get(keyAdHidePhone),
        created = parseObject.get(keyAdCreatedAt),
        views = parseObject.get(keyAdViews),
        userModel = UserModel.fromParse(parseObject.get(keyAdOwner)),
        category = CategoryModel.fromParse(parseObject.get(keyAdCategory)),
        address = AddressModel(
          ufModel: UFModel(initials: parseObject.get(keyAdFederativeUnit)),
          cityModel: CityModel(name: parseObject.get(keyAdCity)),
          cep: parseObject.get(keyAdPostalCode),
          district: parseObject.get(keyAdDistrict),
        ),
        images = parseObject.get<List>(keyAdImages)!.map((e) => e.url).toList();
}
