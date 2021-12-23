import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/category_model.dart';
import 'package:xlo_app/repositories/category_repository.dart';

import 'connectivity_store.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  late ConnectivityStore _connectivityStore;
  late ObservableList<CategoryModel> categories;

  @observable
  String error = "";

  _CategoryStoreBase() {
    _connectivityStore = GetIt.I<ConnectivityStore>();
    categories = ObservableList<CategoryModel>();

    autorun((_) async {
      if (_connectivityStore.isConnected) {
        await loadCategories();
      }
    });
  }

  Future<void> loadCategories() async {
    try {
      final categories = await CategoryRepository().getList();
      setCategories(categories);
    } catch (e) {
      setError(e.toString());
    }
  }

  @action
  void setCategories(List<CategoryModel>? values) {
    categories.clear();

    if (values != null) {
      categories.addAll(values);
    }
  }

  @action
  void setError(String e) => error = e;

  @computed
  List<CategoryModel> get allCategories => List.from(categories)
    ..insert(0, CategoryModel(id: '*', description: 'Todas'));
}
