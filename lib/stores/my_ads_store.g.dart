// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ads_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyAdsStore on _MyAdsStoreBase, Store {
  Computed<List<AdModel>>? _$activeAdsComputed;

  @override
  List<AdModel> get activeAds =>
      (_$activeAdsComputed ??= Computed<List<AdModel>>(() => super.activeAds,
              name: '_MyAdsStoreBase.activeAds'))
          .value;
  Computed<List<AdModel>>? _$pendingAdsComputed;

  @override
  List<AdModel> get pendingAds =>
      (_$pendingAdsComputed ??= Computed<List<AdModel>>(() => super.pendingAds,
              name: '_MyAdsStoreBase.pendingAds'))
          .value;
  Computed<List<AdModel>>? _$soldAdsComputed;

  @override
  List<AdModel> get soldAds =>
      (_$soldAdsComputed ??= Computed<List<AdModel>>(() => super.soldAds,
              name: '_MyAdsStoreBase.soldAds'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_MyAdsStoreBase.isLoading'))
          .value;

  final _$errorAtom = Atom(name: '_MyAdsStoreBase.error');

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

  final _$_adsAtom = Atom(name: '_MyAdsStoreBase._ads');

  @override
  List<AdModel> get _ads {
    _$_adsAtom.reportRead();
    return super._ads;
  }

  @override
  set _ads(List<AdModel> value) {
    _$_adsAtom.reportWrite(value, super._ads, () {
      super._ads = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_MyAdsStoreBase._loading');

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

  final _$_getMyAdsAsyncAction = AsyncAction('_MyAdsStoreBase._getMyAds');

  @override
  Future<void> _getMyAds() {
    return _$_getMyAdsAsyncAction.run(() => super._getMyAds());
  }

  final _$refreshAsyncAction = AsyncAction('_MyAdsStoreBase.refresh');

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$soldAdAsyncAction = AsyncAction('_MyAdsStoreBase.soldAd');

  @override
  Future<dynamic> soldAd(AdModel ad) {
    return _$soldAdAsyncAction.run(() => super.soldAd(ad));
  }

  final _$deleteAdAsyncAction = AsyncAction('_MyAdsStoreBase.deleteAd');

  @override
  Future<dynamic> deleteAd(AdModel ad) {
    return _$deleteAdAsyncAction.run(() => super.deleteAd(ad));
  }

  final _$_MyAdsStoreBaseActionController =
      ActionController(name: '_MyAdsStoreBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_MyAdsStoreBaseActionController.startAction(
        name: '_MyAdsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_MyAdsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
activeAds: ${activeAds},
pendingAds: ${pendingAds},
soldAds: ${soldAds},
isLoading: ${isLoading}
    ''';
  }
}
