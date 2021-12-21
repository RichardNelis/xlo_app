import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/address_model.dart';
import 'package:xlo_app/repositories/cep_repository.dart';

part 'cep_store.g.dart';

class CEPStore = _CEPStoreBase with _$CEPStore;

abstract class _CEPStoreBase with Store {
  _CEPStoreBase(String initialCEP) {
    autorun((_) {
      if (clearCEP.length == 8) {
        _searchCEP();
      } else {
        reset();
      }
    });

    setCEP(initialCEP);
  }

  @observable
  String cep = "";

  @observable
  AddressModel? address;

  @observable
  String error = "";

  @observable
  bool loading = false;

  @action
  void setCEP(String value) => cep = value;

  @computed
  String get clearCEP => cep.replaceAll(RegExp('[^0-9]'), '');

  @action
  Future<void> _searchCEP() async {
    loading = true;

    try {
      error = "";
      address = await CEPRepository().getAddressFromApi(clearCEP);
    } catch (e) {
      address = null;
      error = e.toString();
    }

    loading = false;
  }

  @action
  reset() {
    error = "";
    address = null;
  }
}
