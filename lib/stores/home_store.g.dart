// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount =>
      (_$itemCountComputed ??= Computed<int>(() => super.itemCount,
              name: '_HomeStoreBase.itemCount'))
          .value;
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_HomeStoreBase.showProgress'))
          .value;
  Computed<FilterStore>? _$clonedFilterComputed;

  @override
  FilterStore get clonedFilter => (_$clonedFilterComputed ??=
          Computed<FilterStore>(() => super.clonedFilter,
              name: '_HomeStoreBase.clonedFilter'))
      .value;

  final _$pageAtom = Atom(name: '_HomeStoreBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$lastPageAtom = Atom(name: '_HomeStoreBase.lastPage');

  @override
  bool get lastPage {
    _$lastPageAtom.reportRead();
    return super.lastPage;
  }

  @override
  set lastPage(bool value) {
    _$lastPageAtom.reportWrite(value, super.lastPage, () {
      super.lastPage = value;
    });
  }

  final _$errorAdAtom = Atom(name: '_HomeStoreBase.errorAd');

  @override
  String get errorAd {
    _$errorAdAtom.reportRead();
    return super.errorAd;
  }

  @override
  set errorAd(String value) {
    _$errorAdAtom.reportWrite(value, super.errorAd, () {
      super.errorAd = value;
    });
  }

  final _$loadingAdAtom = Atom(name: '_HomeStoreBase.loadingAd');

  @override
  bool get loadingAd {
    _$loadingAdAtom.reportRead();
    return super.loadingAd;
  }

  @override
  set loadingAd(bool value) {
    _$loadingAdAtom.reportWrite(value, super.loadingAd, () {
      super.loadingAd = value;
    });
  }

  final _$searchAtom = Atom(name: '_HomeStoreBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$categoryModelAtom = Atom(name: '_HomeStoreBase.categoryModel');

  @override
  CategoryModel? get categoryModel {
    _$categoryModelAtom.reportRead();
    return super.categoryModel;
  }

  @override
  set categoryModel(CategoryModel? value) {
    _$categoryModelAtom.reportWrite(value, super.categoryModel, () {
      super.categoryModel = value;
    });
  }

  final _$filterStoreAtom = Atom(name: '_HomeStoreBase.filterStore');

  @override
  FilterStore get filterStore {
    _$filterStoreAtom.reportRead();
    return super.filterStore;
  }

  @override
  set filterStore(FilterStore value) {
    _$filterStoreAtom.reportWrite(value, super.filterStore, () {
      super.filterStore = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void loadNextPage() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.loadNextPage');
    try {
      return super.loadNextPage();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPage() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.resetPage');
    try {
      return super.resetPage();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewAds(List<AdModel> newAds) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.addNewAds');
    try {
      return super.addNewAds(newAds);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorAd(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setErrorAd');
    try {
      return super.setErrorAd(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingAd(bool value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setLoadingAd');
    try {
      return super.setLoadingAd(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(CategoryModel value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(FilterStore value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
lastPage: ${lastPage},
errorAd: ${errorAd},
loadingAd: ${loadingAd},
search: ${search},
categoryModel: ${categoryModel},
filterStore: ${filterStore},
itemCount: ${itemCount},
showProgress: ${showProgress},
clonedFilter: ${clonedFilter}
    ''';
  }
}
