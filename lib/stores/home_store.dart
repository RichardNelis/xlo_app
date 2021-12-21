import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/ad_model.dart';
import 'package:xlo_app/models/category_model.dart';
import 'package:xlo_app/repositories/ad_repository.dart';
import 'package:xlo_app/stores/connectivity_store.dart';
import 'package:xlo_app/stores/filter_store.dart';
import 'package:xlo_app/utils/constants.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {
    autorun((_) async {
      setLoadingAd(true);

      try {
        List<AdModel> ads = await AdRepository().getHomeAdList(
          filter: filterStore,
          search: search,
          category: categoryModel,
          page: page,
        );

        addNewAds(ads);
        setErrorAd("");
      } catch (e) {
        setErrorAd(e.toString());
      }

      setLoadingAd(false);
    });
  }

  final ConnectivityStore _connectivityStore = GetIt.I<ConnectivityStore>();

  @observable
  int page = 0;

  @observable
  bool lastPage = false;

  @action
  void loadNextPage() {
    page++;
  }

  @action
  void resetPage() {
    page = 0;
    lastPage = false;
    adList.clear();
  }

  @computed
  int get itemCount => lastPage ? adList.length : adList.length + 1;

  @action
  void addNewAds(List<AdModel> newAds) {
    if (newAds.length < itemCountPage) {
      lastPage = true;
    }

    adList.addAll(newAds);
  }

  @computed
  bool get showProgress => loadingAd && adList.isEmpty;

  //LisAd
  @observable
  String errorAd = "";

  @action
  void setErrorAd(String value) => errorAd = value;

  ObservableList<AdModel> adList = ObservableList<AdModel>();

  @observable
  bool loadingAd = false;

  @action
  void setLoadingAd(bool value) => loadingAd = value;

  //Search
  @observable
  String search = "";

  @action
  void setSearch(String value) {
    search = value;
    resetPage();
  }

  //Category
  @observable
  CategoryModel? categoryModel;

  @action
  void setCategory(CategoryModel value) {
    categoryModel = value;
    resetPage();
  }

  //Filter
  @observable
  FilterStore filterStore = FilterStore();

  @computed
  FilterStore get clonedFilter => filterStore.clone();

  @action
  void setFilter(FilterStore value) {
    filterStore = value;
    resetPage();
  }
}
