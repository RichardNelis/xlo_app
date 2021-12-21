import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/components/error/error_box.dart';
import 'package:xlo_app/models/category_model.dart';
import 'package:xlo_app/stores/category_store.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel? selected;
  final bool showAll;

  const CategoryScreen({Key? key, this.selected, this.showAll = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<CategoryStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias"),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          child: Observer(
            builder: (_) {
              if (store.error.isNotEmpty) {
                return ErrorBox(message: store.error);
              } else if (store.categories.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final categories =
                    showAll ? store.allCategories : store.categories;

                return ListView.separated(
                  itemCount: categories.length,
                  itemBuilder: (_, index) {
                    final category = categories[index];

                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pop(category);
                      },
                      child: Container(
                        height: 50,
                        color: category.id == selected?.id
                            ? Colors.purple.withAlpha(50)
                            : null,
                        alignment: Alignment.center,
                        child: Text(
                          category.description,
                          style: TextStyle(
                            color: category.id == selected?.id
                                ? Colors.purple
                                : Colors.grey[700],
                            fontWeight: category.id == selected?.id
                                ? FontWeight.bold
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(
                    height: 0.1,
                    color: Colors.grey,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
