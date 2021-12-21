import 'package:xlo_app/models/city_model.dart';
import 'package:xlo_app/models/uf_model.dart';

class AddressModel {
  UFModel ufModel;
  CityModel cityModel;
  String cep;
  String district;

  AddressModel({
    required this.ufModel,
    required this.cityModel,
    required this.cep,
    required this.district,
  });
}
