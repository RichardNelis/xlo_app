import 'package:mobx/mobx.dart';

import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/user_repository.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStoreBase with _$UserManagerStore;

abstract class _UserManagerStoreBase with Store {
  _UserManagerStoreBase() {
    _getCurrentUser();
  }

  @observable
  UserModel? userModel;

  @action
  void setUser(UserModel? value) => userModel = value;

  @computed
  bool get isLoggedIn => userModel != null;

  Future<void> _getCurrentUser() async {
    final result = await UserRepository().currentUser();

    if (result != null) {
      setUser(result);
    }
  }

  @action
  Future<void> logout() async {
    try {
      final result = await UserRepository().logout();

      if (result) {
        setUser(null);
      }
    } catch (e) {}
  }
}
