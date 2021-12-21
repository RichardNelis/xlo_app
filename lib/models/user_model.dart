import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_app/repositories/table_keys.dart';

enum UserType { particular, profissional }

class UserModel {
  String? id;
  String name;
  String email;
  String phone;
  String? password;
  UserType? type;

  DateTime? createdAt;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.password,
    this.type,
    this.createdAt,
  }) {
    type = type ?? UserType.particular;
  }

  UserModel.fromParse(ParseUser parseUser)
      : id = parseUser.objectId,
        name = parseUser.get(keyUserName),
        email = parseUser.get(keyUserEmail) ?? "",
        phone = parseUser.get(keyUserPhone),
        type = UserType.values[parseUser.get(keyUserType)],
        createdAt = parseUser.get(keyUserCreatedAt);
}
