import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/ad_model.dart';
import 'package:xlo_app/repositories/favorite_repository.dart';

import 'user_manager_store.dart';

part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  final UserManagerStore userStore = GetIt.I<UserManagerStore>();

  ObservableList<AdModel> favoriteList = ObservableList<AdModel>();

  _FavoriteStoreBase() {
    reaction((_) => userStore.isLoggedIn, (_) {
      _getFavoriteList();
    });
  }

  Future<void> _getFavoriteList() async {
    try {
      favoriteList.clear();

      final favorites =
          await FavoriteRepository().getFavorites(userStore.userModel!);

      favoriteList.addAll(favorites);
    } catch (e) {
      error = e.toString();
    }
  }

  @observable
  String error = "";

  @action
  Future<void> toggleFavorite(AdModel ad) async {
    try {
      if (favoriteList.any((element) => element.id == ad.id)) {
        favoriteList.removeWhere((element) => element.id == ad.id);

        await FavoriteRepository()
            .delete(adModel: ad, userModel: userStore.userModel!);
      } else {
        favoriteList.add(ad);

        await FavoriteRepository()
            .save(adModel: ad, userModel: userStore.userModel!);
      }
    } catch (e) {
      error = e.toString();
    }
  }
}
