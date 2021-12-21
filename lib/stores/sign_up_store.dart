import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/helpers/extensions.dart';
import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/user_repository.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  //Name
  @observable
  String? name;

  @action
  void setName(value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length > 6;

  @computed
  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  //E-mail
  @observable
  String? email;

  @action
  void setEmail(value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  @computed
  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  //Phone
  @observable
  String? phone;

  @action
  void setPhone(value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;

  @computed
  String? get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  //Password
  @observable
  String? password;

  @action
  void setPassword(value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 6;

  @computed
  String? get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if (password!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha muito curta';
    }
  }

  //Confirm Password
  @observable
  String? confirmPassword;

  @action
  void setConfirmPassword(value) => confirmPassword = value;

  @computed
  bool get confirmPasswordValid =>
      confirmPassword != null && password == confirmPassword;

  @computed
  String? get confirmPasswordError {
    if (confirmPassword == null || confirmPasswordValid) {
      return null;
    } else if (confirmPassword!.isNotEmpty && !confirmPasswordValid) {
      return 'Senhas não coincidem';
    } else {
      return 'Campo obrigatório';
    }
  }

  @computed
  bool get isFormValid =>
      nameValid &&
      emailValid &&
      phoneValid &&
      passwordValid &&
      confirmPasswordValid;

  @observable
  bool loading = false;

  @observable
  String error = "";

  Future<void> signUp() async {
    loading = true;

    UserModel userModel = UserModel(
      name: name!,
      email: email!,
      phone: phone!,
      password: password!,
    );

    try {
      final result = await UserRepository().signUp(userModel);

      GetIt.I<UserManagerStore>().setUser(result);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @computed
  VoidCallback? get signUpPressed => isFormValid && !loading ? signUp : null;
}
