// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStore on _CreateStoreBase, Store {
  Computed<bool>? _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: '_CreateStoreBase.imagesValid'))
          .value;
  Computed<String>? _$imageErrorComputed;

  @override
  String get imageError =>
      (_$imageErrorComputed ??= Computed<String>(() => super.imageError,
              name: '_CreateStoreBase.imageError'))
          .value;
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_CreateStoreBase.titleValid'))
          .value;
  Computed<String?>? _$titleErrorComputed;

  @override
  String? get titleError =>
      (_$titleErrorComputed ??= Computed<String?>(() => super.titleError,
              name: '_CreateStoreBase.titleError'))
          .value;
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_CreateStoreBase.descriptionValid'))
      .value;
  Computed<String?>? _$descriptionErrorComputed;

  @override
  String? get descriptionError => (_$descriptionErrorComputed ??=
          Computed<String?>(() => super.descriptionError,
              name: '_CreateStoreBase.descriptionError'))
      .value;
  Computed<bool>? _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_CreateStoreBase.categoryValid'))
          .value;
  Computed<String>? _$categoryErrorComputed;

  @override
  String get categoryError =>
      (_$categoryErrorComputed ??= Computed<String>(() => super.categoryError,
              name: '_CreateStoreBase.categoryError'))
          .value;
  Computed<AddressModel?>? _$addressComputed;

  @override
  AddressModel? get address =>
      (_$addressComputed ??= Computed<AddressModel?>(() => super.address,
              name: '_CreateStoreBase.address'))
          .value;
  Computed<bool>? _$addressValidComputed;

  @override
  bool get addressValid =>
      (_$addressValidComputed ??= Computed<bool>(() => super.addressValid,
              name: '_CreateStoreBase.addressValid'))
          .value;
  Computed<String?>? _$addressErrorComputed;

  @override
  String? get addressError =>
      (_$addressErrorComputed ??= Computed<String?>(() => super.addressError,
              name: '_CreateStoreBase.addressError'))
          .value;
  Computed<double?>? _$priceComputed;

  @override
  double? get price => (_$priceComputed ??=
          Computed<double?>(() => super.price, name: '_CreateStoreBase.price'))
      .value;
  Computed<bool>? _$priceValidComputed;

  @override
  bool get priceValid =>
      (_$priceValidComputed ??= Computed<bool>(() => super.priceValid,
              name: '_CreateStoreBase.priceValid'))
          .value;
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError =>
      (_$priceErrorComputed ??= Computed<String?>(() => super.priceError,
              name: '_CreateStoreBase.priceError'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CreateStoreBase.isFormValid'))
          .value;
  Computed<VoidCallback?>? _$sendPressedComputed;

  @override
  VoidCallback? get sendPressed => (_$sendPressedComputed ??=
          Computed<VoidCallback?>(() => super.sendPressed,
              name: '_CreateStoreBase.sendPressed'))
      .value;

  final _$titleAtom = Atom(name: '_CreateStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_CreateStoreBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$categoryAtom = Atom(name: '_CreateStoreBase.category');

  @override
  CategoryModel? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(CategoryModel? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$priceTextAtom = Atom(name: '_CreateStoreBase.priceText');

  @override
  String get priceText {
    _$priceTextAtom.reportRead();
    return super.priceText;
  }

  @override
  set priceText(String value) {
    _$priceTextAtom.reportWrite(value, super.priceText, () {
      super.priceText = value;
    });
  }

  final _$hidePhoneAtom = Atom(name: '_CreateStoreBase.hidePhone');

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  final _$showErrorsAtom = Atom(name: '_CreateStoreBase.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CreateStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$erroSendAtom = Atom(name: '_CreateStoreBase.erroSend');

  @override
  String get erroSend {
    _$erroSendAtom.reportRead();
    return super.erroSend;
  }

  @override
  set erroSend(String value) {
    _$erroSendAtom.reportWrite(value, super.erroSend, () {
      super.erroSend = value;
    });
  }

  final _$savedAdAtom = Atom(name: '_CreateStoreBase.savedAd');

  @override
  AdModel? get savedAd {
    _$savedAdAtom.reportRead();
    return super.savedAd;
  }

  @override
  set savedAd(AdModel? value) {
    _$savedAdAtom.reportWrite(value, super.savedAd, () {
      super.savedAd = value;
    });
  }

  final _$_sendAsyncAction = AsyncAction('_CreateStoreBase._send');

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  final _$_CreateStoreBaseActionController =
      ActionController(name: '_CreateStoreBase');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(CategoryModel value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
category: ${category},
priceText: ${priceText},
hidePhone: ${hidePhone},
showErrors: ${showErrors},
loading: ${loading},
erroSend: ${erroSend},
savedAd: ${savedAd},
imagesValid: ${imagesValid},
imageError: ${imageError},
titleValid: ${titleValid},
titleError: ${titleError},
descriptionValid: ${descriptionValid},
descriptionError: ${descriptionError},
categoryValid: ${categoryValid},
categoryError: ${categoryError},
address: ${address},
addressValid: ${addressValid},
addressError: ${addressError},
price: ${price},
priceValid: ${priceValid},
priceError: ${priceError},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
