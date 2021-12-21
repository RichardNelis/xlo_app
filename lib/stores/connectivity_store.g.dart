// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectivityStore on _ConnectivityStoreBase, Store {
  Computed<bool>? _$isConnectedComputed;

  @override
  bool get isConnected =>
      (_$isConnectedComputed ??= Computed<bool>(() => super.isConnected,
              name: '_ConnectivityStoreBase.isConnected'))
          .value;

  final _$_connectedAtom = Atom(name: '_ConnectivityStoreBase._connected');

  @override
  bool get _connected {
    _$_connectedAtom.reportRead();
    return super._connected;
  }

  @override
  set _connected(bool value) {
    _$_connectedAtom.reportWrite(value, super._connected, () {
      super._connected = value;
    });
  }

  final _$_setupListenerAsyncAction =
      AsyncAction('_ConnectivityStoreBase._setupListener');

  @override
  Future<void> _setupListener() {
    return _$_setupListenerAsyncAction.run(() => super._setupListener());
  }

  final _$_ConnectivityStoreBaseActionController =
      ActionController(name: '_ConnectivityStoreBase');

  @override
  dynamic setConnected(bool value) {
    final _$actionInfo = _$_ConnectivityStoreBaseActionController.startAction(
        name: '_ConnectivityStoreBase.setConnected');
    try {
      return super.setConnected(value);
    } finally {
      _$_ConnectivityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isConnected: ${isConnected}
    ''';
  }
}
