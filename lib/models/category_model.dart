import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_app/repositories/table_keys.dart';

class CategoryModel {
  String id;
  String description;

  CategoryModel({
    required this.id,
    required this.description,
  });

  CategoryModel.fromParse(ParseObject parseObject)
      : id = parseObject.objectId!,
        description = parseObject.get(keyCategoryDescription);
}
