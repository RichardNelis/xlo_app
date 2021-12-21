// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserManagerStore on _UserManagerStoreBase, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: '_UserManagerStoreBase.isLoggedIn'))
          .value;

  final _$userModelAtom = Atom(name: '_UserManagerStoreBase.userModel');

  @override
  UserModel? get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel? value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$logoutAsyncAction = AsyncAction('_UserManagerStoreBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_UserManagerStoreBaseActionController =
      ActionController(name: '_UserManagerStoreBase');

  @override
  void setUser(UserModel? value) {
    final _$actionInfo = _$_UserManagerStoreBaseActionController.startAction(
        name: '_UserManagerStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_UserManagerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
