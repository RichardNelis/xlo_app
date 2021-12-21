// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStoreBase, Store {
  final _$errorAtom = Atom(name: '_FavoriteStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$toggleFavoriteAsyncAction =
      AsyncAction('_FavoriteStoreBase.toggleFavorite');

  @override
  Future<void> toggleFavorite(AdModel ad) {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite(ad));
  }

  @override
  String toString() {
    return '''
error: ${error}
    ''';
  }
}
