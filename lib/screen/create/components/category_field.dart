import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screen/category/category_screen.dart';
import 'package:xlo_app/stores/create_store.dart';

class CategoryField extends StatelessWidget {
  final CreateStore store;

  const CategoryField({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            ListTile(
              title: Text(
                "Categoria *",
                style: store.category == null
                    ? const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                        fontSize: 18,
                      )
                    : const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
              ),
              dense: true,
              subtitle: Text(
                store.category == null ? '' : store.category!.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              trailing: const Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                final category = await showDialog(
                  context: context,
                  builder: (_) {
                    return CategoryScreen(
                      showAll: false,
                      selected: store.category,
                    );
                  },
                );

                if (category != null) {
                  store.setCategory(category);
                }
              },
            ),
            store.categoryError.isNotEmpty
                ? Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    child: Text(
                      store.categoryError,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  )
                : Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                  )
          ],
        );
      },
    );
  }
}
