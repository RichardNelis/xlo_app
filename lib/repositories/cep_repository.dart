import 'package:dio/dio.dart';
import 'package:xlo_app/models/address_model.dart';
import 'package:xlo_app/models/city_model.dart';
import 'package:xlo_app/repositories/ibge_repository.dart';

class CEPRepository {
  var url = 'https://viacep.com.br/ws/cepcode/json/';

  late Dio _dio;

  CEPRepository() {
    _dio = Dio();
  }

  Future<AddressModel?> getAddressFromApi(String cep) async {
    try {
      if (cep.isEmpty) {
        return Future.error('CEP inválido');
      }

      final cleanCEP = cep.replaceAll(RegExp('[^0-9]'), '');

      if (cleanCEP.length != 8) {
        return Future.error('CEP inválido');
      }

      url = url.replaceAll('cepcode', cleanCEP);

      final response = await _dio.get<Map>(url);

      if (response.data!.containsKey('erro') && response.data!['erro']) {
        return Future.error('CEP inválido');
      }

      final ufList = await IBGERepository().getUFList();

      return AddressModel(
          ufModel: ufList.firstWhere(
            (uf) => uf.initials == response.data!['uf'],
          ),
          cityModel: CityModel(
            name: response.data!['localidade'],
          ),
          cep: response.data!['cep'],
          district: response.data!['bairro']);
    } catch (e) {
      return Future.error('Falha ao buscar CEP');
    }
  }
}
