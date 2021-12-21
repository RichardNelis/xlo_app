import 'package:connectivity/connectivity.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStoreBase with _$ConnectivityStore;

abstract class _ConnectivityStoreBase with Store {
  _ConnectivityStoreBase() {
    _setupListener();
  }

  @observable
  bool _connected = false;

  @action
  setConnected(bool value) => _connected = value;

  @computed
  bool get isConnected => _connected;

  @action
  Future<void> _setupListener() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
          setConnected(true);
          break;
        case ConnectivityResult.none:
          setConnected(false);
          break;
        default:
          setConnected(false);
          break;
      }
    });
  }
}
