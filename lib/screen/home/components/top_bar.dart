import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screen/category/category_screen.dart';
import 'package:xlo_app/screen/filter/filter_screen.dart';
import 'package:xlo_app/stores/home_store.dart';

import 'bar_button.dart';

class TopBar extends StatelessWidget {
  final HomeStore store = GetIt.I<HomeStore>();

  TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Observer(
          builder: (_) {
            return BarButton(
              label: store.categoryModel?.description ?? 'Categorias',
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[400]!),
                ),
              ),
              onTap: () async {
                final category = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CategoryScreen(
                      showAll: true,
                      selected: store.categoryModel,
                    ),
                  ),
                );

                if (category != null) {
                  store.setCategory(category);
                }
              },
            );
          },
        ),
        BarButton(
          label: 'Filtros',
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.grey[400]!),
              bottom: BorderSide(color: Colors.grey[400]!),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => FilterScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
