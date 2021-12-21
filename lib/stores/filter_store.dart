import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/stores/home_store.dart';

part 'filter_store.g.dart';

enum OrderBy { date, price }

const vendorTypeParticular = 1 << 0;
const vendorTypeProfessional = 1 << 1;

class FilterStore = _FilterStoreBase with _$FilterStore;

abstract class _FilterStoreBase with Store {
  _FilterStoreBase({
    this.orderBy,
    this.minPrice,
    this.maxPrice,
    this.vendorType,
  }) {
    orderBy = orderBy ?? OrderBy.date;
    vendorType = vendorType ?? vendorTypeParticular;
  }

  //OrderBY
  @observable
  OrderBy? orderBy;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  //Min/Max preço
  @observable
  int? minPrice, maxPrice;

  @action
  void setMinPrice(int? value) => minPrice = value;

  @action
  void setMaxPrice(int? value) => maxPrice = value;

  @computed
  String get priceError {
    if (maxPrice != null && minPrice != null && maxPrice! < minPrice!) {
      return "Faixa de preço inválida";
    } else {
      return "";
    }
  }

  @observable
  int? vendorType;

  @action
  void selectVendorType(int value) => vendorType = value;

  @action
  setVendorType(int type) => vendorType = vendorType! | type;

  @action
  resetVendorType(int type) => vendorType = vendorType! & ~type;

  @computed
  bool get isTypeParticular =>
      vendorType! & (vendorType! & vendorTypeParticular) != 0;

  @computed
  bool get isTypeProfessional =>
      vendorType! & (vendorType! & vendorTypeProfessional) != 0;

  @computed
  bool get isFormValid => priceError.isEmpty;

  @action
  void save(FilterStore store) {
    GetIt.I<HomeStore>().setFilter(store);
  }

  @action
  FilterStore clone() {
    return FilterStore(
      orderBy: orderBy,
      minPrice: minPrice,
      maxPrice: maxPrice,
      vendorType: vendorType,
    );
  }
}
