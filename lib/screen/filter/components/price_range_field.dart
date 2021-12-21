import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screen/filter/components/section_title.dart';
import 'package:xlo_app/stores/filter_store.dart';

import 'price_field.dart';

class PriceRangeField extends StatelessWidget {
  final FilterStore store;

  const PriceRangeField({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Preço"),
        const SizedBox(width: 12),
        Row(
          children: [
            PriceField(
              label: "Min",
              initialValue: store.minPrice,
              onChanged: store.setMinPrice,
            ),
            const SizedBox(width: 12),
            PriceField(
              label: "Max",
              initialValue: store.maxPrice,
              onChanged: store.setMaxPrice,
            ),
          ],
        ),
        Observer(
          builder: (_) {
            if (store.priceError.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  store.priceError,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              );
            }

            return Container();
          },
        )
      ],
    );
  }
}
