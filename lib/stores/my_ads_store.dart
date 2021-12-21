import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/ad_model.dart';

import 'package:xlo_app/repositories/ad_repository.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'my_ads_store.g.dart';

class MyAdsStore = _MyAdsStoreBase with _$MyAdsStore;

abstract class _MyAdsStoreBase with Store {
  _MyAdsStoreBase() {
    _getMyAds();
  }

  @observable
  String error = "";

  @observable
  List<AdModel> _ads = <AdModel>[];

  @computed
  List<AdModel> get activeAds =>
      _ads.where((element) => element.status == AdStatus.active).toList();

  @computed
  List<AdModel> get pendingAds =>
      _ads.where((element) => element.status == AdStatus.pending).toList();

  @computed
  List<AdModel> get soldAds =>
      _ads.where((element) => element.status == AdStatus.sold).toList();

  @action
  Future<void> _getMyAds() async {
    error = "";
    setLoading(true);

    try {
      final userStore = GetIt.I<UserManagerStore>();
      final results = await AdRepository().getMyAds(user: userStore.userModel!);

      if (results.isNotEmpty) {
        _ads = results;
      }
    } catch (e) {
      error = e.toString();
    }

    setLoading(false);
  }

  @action
  Future<void> refresh() async => await _getMyAds();

  @observable
  bool _loading = false;

  @action
  void setLoading(bool value) => _loading = value;

  @computed
  bool get isLoading => _loading;

  @action
  Future soldAd(AdModel ad) async {
    setLoading(true);

    try {
      await AdRepository().sold(ad);
      refresh();
    } catch (e) {}

    setLoading(false);
  }

  @action
  Future deleteAd(AdModel ad) async {
    setLoading(true);

    try {
      await AdRepository().delete(ad);
      refresh();
    } catch (e) {}

    setLoading(false);
  }
}
