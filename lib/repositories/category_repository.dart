import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_app/models/category_model.dart';
import 'package:xlo_app/repositories/parse_errors.dart';
import 'package:xlo_app/repositories/table_keys.dart';

class CategoryRepository {
  Future<List<CategoryModel>?> getList() async {
    final queryBuilder = QueryBuilder(ParseObject(keyCategoryTable))
      ..orderByAscending(keyCategoryDescription);

    final response = await queryBuilder.query();

    if (response.success) {
      return response.results!.map((e) => CategoryModel.fromParse(e)).toList();
    } else {
      throw ParseErrors.getDescription(response.error!.code)!;
    }
  }
}
