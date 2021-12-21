import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_app/models/city_model.dart';

import 'package:xlo_app/models/uf_model.dart';

class IBGERepository {
  final url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/';

  late Dio _dio;

  IBGERepository() {
    _dio = Dio();
  }

  Future<List<UFModel>> getUFList() async {
    try {
      final preferences = await SharedPreferences.getInstance();

      if (preferences.containsKey('UF_LIST')) {
        final pJson = json.decode(preferences.getString('UF_LIST')!);

        return _sortAsc(pJson.map<UFModel>((e) => UFModel.fromMap(e)).toList());
      } else {
        final response = await _dio.get<List>(url);

        if (response.data != null) {
          final list = _sortAsc(
              response.data!.map<UFModel>((e) => UFModel.fromMap(e)).toList());

          preferences.setString('UF_LIST', json.encode(response.data));

          return list;
        } else {
          throw throw Exception();
        }
      }
    } on DioError {
      return Future.error('Falha ao obter lista de Estados');
    } on Exception {
      return Future.error('Falha ao obter lista de Estados');
    }
  }

  List<UFModel> _sortAsc(List<UFModel> list) => list
    ..sort((a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));

  Future<List<CityModel>?> getCityListFromApi(UFModel ufModel) async {
    try {
      final response = await _dio.get<List>("$url/${ufModel.id}/municipios");

      final list = response.data
          ?.map<CityModel>((e) => CityModel.fromJson(e))
          .toList()
        ?..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      return list;
    } on DioError {
      return Future.error('Falha ao obter lista de Cidades');
    }
  }
}
