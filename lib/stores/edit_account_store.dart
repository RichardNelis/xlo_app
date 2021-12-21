import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/user_repository.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'edit_account_store.g.dart';

class EditAccountStore = _EditAccountStoreBase with _$EditAccountStore;

abstract class _EditAccountStoreBase with Store {
  _EditAccountStoreBase() {
    userManagerStore = GetIt.I<UserManagerStore>();
    user = userManagerStore.userModel!;

    userType = user.type!;
    name = user.name;
    phone = user.phone;
  }

  late UserManagerStore userManagerStore;

  late UserModel user;

  //UserType
  @observable
  UserType userType = UserType.particular;

  @action
  void setUserType(int value) => userType = UserType.values[value];

  //Name
  @observable
  String name = "";

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name.isNotEmpty && name.length >= 6;

  @computed
  String? get nameError {
    if (name.isEmpty || nameValid) {
      return null;
    } else if (name.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  //Phone
  @observable
  String phone = "";

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => name.isNotEmpty && phone.length >= 14;

  @computed
  String? get phoneError {
    if (phone.isEmpty || phoneValid) {
      return null;
    } else if (phone.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  //Password
  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid =>
      (password.isNotEmpty && password.length >= 6) || password.isEmpty;

  @computed
  String? get passwordError {
    if (passwordValid) {
      return null;
    } else {
      return 'Senha muito curta';
    }
  }

  //Confirm Password
  @observable
  String confirmPassword = "";

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @computed
  bool get confirmPasswordValid =>
      (confirmPassword.isEmpty && password.isEmpty) ||
      (confirmPassword.isNotEmpty &&
          password.isNotEmpty &&
          password == confirmPassword);

  @computed
  String? get confirmPasswordError {
    if ((confirmPassword.isEmpty && password.isEmpty) || confirmPasswordValid) {
      return null;
    } else if (confirmPassword.isNotEmpty && !confirmPasswordValid) {
      return 'Senhas não coincidem';
    } else {
      return 'Campo obrigatório';
    }
  }

  @computed
  bool get isFormValid =>
      nameValid && phoneValid && passwordValid && confirmPasswordValid;

  @observable
  bool _loading = false;

  @action
  void setLoading(bool value) => _loading = value;

  @computed
  bool get isLoading => _loading;

  @observable
  String erro = "";

  @action
  Future<void> _save() async {
    setLoading(true);

    user.name = name;
    user.phone = phone;
    user.type = userType;

    if (password.isNotEmpty) {
      user.password = password;
    }

    try {
      await UserRepository().save(user);
      userManagerStore.setUser(user);
    } catch (e) {
      erro = e.toString();
    }

    setLoading(false);
  }

  @computed
  VoidCallback? get savePressed => isFormValid && !_loading ? _save : null;
}
