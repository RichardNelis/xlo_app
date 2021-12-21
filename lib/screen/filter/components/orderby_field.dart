import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/stores/filter_store.dart';

import 'section_title.dart';

class OrderByField extends StatelessWidget {
  final FilterStore store;

  const OrderByField({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title, OrderBy option) {
      return GestureDetector(
        onTap: () {
          store.setOrderBy(option);
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: store.orderBy == option ? Colors.purple : Colors.transparent,
            border: Border.all(
              color: store.orderBy == option ? Colors.purple : Colors.grey,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: store.orderBy == option ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Ordernar por"),
        Observer(
          builder: (_) {
            return Row(
              children: [
                buildOption('Data', OrderBy.date),
                const SizedBox(width: 12),
                buildOption('Preço', OrderBy.price),
              ],
            );
          },
        )
      ],
    );
  }
}
