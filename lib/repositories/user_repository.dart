import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/parse_errors.dart';
import 'package:xlo_app/repositories/table_keys.dart';

class UserRepository {
  Future<UserModel> signUp(UserModel userModel) async {
    final parseUser =
        ParseUser(userModel.email, userModel.password, userModel.email)
          ..set<String>(keyUserName, userModel.name)
          ..set<String>(keyUserPhone, userModel.phone)
          ..set<int>(keyUserType, userModel.type!.index);

    final response = await parseUser.signUp();

    if (response.success) {
      return UserModel.fromParse(response.result);
    } else {
      return _customParseError(response);
    }
  }

  Future<UserModel> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if (response.success) {
      return UserModel.fromParse(response.result);
    } else {
      return _customParseError(response);
    }
  }

  Future<UserModel> _customParseError(ParseResponse response) {
    return Future.error(ParseErrors.getDescription(response.error!.code)!);
  }

  Future<UserModel?> currentUser() async {
    ParseUser? parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken!);

      if (response != null && response.success) {
        return UserModel.fromParse(response.result);
      } else {
        await parseUser.logout();
      }
    }

    return null;
  }

  Future<bool> logout() async {
    ParseUser? parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      final response = await parseUser.logout();

      return response.success;
    } else {
      return false;
    }
  }

  Future<void> save(UserModel user) async {
    try {
      ParseUser? parseUser = await ParseUser.currentUser();

      if (parseUser != null) {
        parseUser.set<String>(keyUserName, user.name);
        parseUser.set<String>(keyUserPhone, user.phone);
        parseUser.set<int>(keyUserType, user.type!.index);

        if (user.password != null) {
          parseUser.password = user.password;
        }

        final response = await parseUser.save();

        if (!response.success) {
          throw _customParseError(response);
        } else {
          if (user.password != null) {
            await parseUser.logout();

            final loginResponse =
                await ParseUser(user.email, user.password, '').login();

            if (!loginResponse.success) {
              throw _customParseError(response);
            }
          }
        }
      }
    } catch (e) {
      Future.error(e);
    }
  }
}
