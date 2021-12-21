import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/helpers/extensions.dart';
import 'package:xlo_app/repositories/user_repository.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  //E-mail
  @observable
  String? email;

  @action
  void setEmail(value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  @computed
  String? get emailError =>
      email == null || emailValid ? null : 'E-mail inválido';

  //Password
  @observable
  String? password;

  @action
  void setPassword(value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 6;

  @computed
  String? get passwordError =>
      password == null || passwordValid ? null : 'Senha inválida';

  @computed
  bool get isFormValid => emailValid && passwordValid;

  @observable
  bool loading = false;

  @observable
  String error = "";

  @action
  Future<void> login() async {
    loading = true;
    error = "";
    
    try {
      final result = await UserRepository().loginWithEmail(email!, password!);

      GetIt.I<UserManagerStore>().setUser(result);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @computed
  VoidCallback? get loginPressed => isFormValid && !loading ? login : null;
}
