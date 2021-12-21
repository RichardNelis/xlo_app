class CityModel {
  int? id;
  String name;

  CityModel({
    this.id,
    required this.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json['id'],
        name: json['nome'],
      );
}
