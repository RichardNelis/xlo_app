import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/category_model.dart';
import 'package:xlo_app/repositories/category_repository.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  ObservableList<CategoryModel> categories = ObservableList<CategoryModel>();

  @observable
  String error = "";

  _CategoryStoreBase() {
    loadCategories();
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
