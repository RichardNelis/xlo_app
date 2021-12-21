// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditAccountStore on _EditAccountStoreBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_EditAccountStoreBase.nameValid'))
          .value;
  Computed<String?>? _$nameErrorComputed;

  @override
  String? get nameError =>
      (_$nameErrorComputed ??= Computed<String?>(() => super.nameError,
              name: '_EditAccountStoreBase.nameError'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_EditAccountStoreBase.phoneValid'))
          .value;
  Computed<String?>? _$phoneErrorComputed;

  @override
  String? get phoneError =>
      (_$phoneErrorComputed ??= Computed<String?>(() => super.phoneError,
              name: '_EditAccountStoreBase.phoneError'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_EditAccountStoreBase.passwordValid'))
          .value;
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: '_EditAccountStoreBase.passwordError'))
          .value;
  Computed<bool>? _$confirmPasswordValidComputed;

  @override
  bool get confirmPasswordValid => (_$confirmPasswordValidComputed ??=
          Computed<bool>(() => super.confirmPasswordValid,
              name: '_EditAccountStoreBase.confirmPasswordValid'))
      .value;
  Computed<String?>? _$confirmPasswordErrorComputed;

  @override
  String? get confirmPasswordError => (_$confirmPasswordErrorComputed ??=
          Computed<String?>(() => super.confirmPasswordError,
              name: '_EditAccountStoreBase.confirmPasswordError'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_EditAccountStoreBase.isFormValid'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_EditAccountStoreBase.isLoading'))
          .value;
  Computed<VoidCallback?>? _$savePressedComputed;

  @override
  VoidCallback? get savePressed => (_$savePressedComputed ??=
          Computed<VoidCallback?>(() => super.savePressed,
              name: '_EditAccountStoreBase.savePressed'))
      .value;

  final _$userTypeAtom = Atom(name: '_EditAccountStoreBase.userType');

  @override
  UserType get userType {
    _$userTypeAtom.reportRead();
    return super.userType;
  }

  @override
  set userType(UserType value) {
    _$userTypeAtom.reportWrite(value, super.userType, () {
      super.userType = value;
    });
  }

  final _$nameAtom = Atom(name: '_EditAccountStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$phoneAtom = Atom(name: '_EditAccountStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$passwordAtom = Atom(name: '_EditAccountStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom =
      Atom(name: '_EditAccountStoreBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_EditAccountStoreBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$erroAtom = Atom(name: '_EditAccountStoreBase.erro');

  @override
  String get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(String value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  final _$_saveAsyncAction = AsyncAction('_EditAccountStoreBase._save');

  @override
  Future<void> _save() {
    return _$_saveAsyncAction.run(() => super._save());
  }

  final _$_EditAccountStoreBaseActionController =
      ActionController(name: '_EditAccountStoreBase');

  @override
  void setUserType(int value) {
    final _$actionInfo = _$_EditAccountStoreBaseActionController.startAction(
        name: '_EditAccountStoreBase.setUserType');
    try {
      return super.setUserType(value);
    } finally {
      _$_EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_EditAccountStoreBaseActionController.startAction(
        name: '_EditAccountStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_EditAccountStoreBaseActionController.startAction(
        name: '_EditAccountStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_EditAccountStoreBaseActionController.startAction(
        name: '_EditAccountStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_EditAccountStoreBaseActionController.startAction(
        name: '_EditAccountStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_EditAccountStoreBaseActionController.startAction(
        name: '_EditAccountStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userType: ${userType},
name: ${name},
phone: ${phone},
password: ${password},
confirmPassword: ${confirmPassword},
erro: ${erro},
nameValid: ${nameValid},
nameError: ${nameError},
phoneValid: ${phoneValid},
phoneError: ${phoneError},
passwordValid: ${passwordValid},
passwordError: ${passwordError},
confirmPasswordValid: ${confirmPasswordValid},
confirmPasswordError: ${confirmPasswordError},
isFormValid: ${isFormValid},
isLoading: ${isLoading},
savePressed: ${savePressed}
    ''';
  }
}
