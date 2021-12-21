import 'dart:convert';

class UFModel {
  int? id;
  String initials;
  String? name;

  UFModel({
    this.id,
    required this.initials,
    this.name,
  });

  factory UFModel.fromMap(Map<String, dynamic> json) => UFModel(
        id: json["id"],
        initials: json['sigla'],
        name: json['nome'],
      );

  factory UFModel.fromJson(String source) =>
      UFModel.fromMap(json.decode(source));
}
