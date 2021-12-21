import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screen/filter/components/orderby_field.dart';
import 'package:xlo_app/stores/filter_store.dart';
import 'package:xlo_app/stores/home_store.dart';

import 'components/price_range_field.dart';
import 'components/vendor_type_field.dart';

class FilterScreen extends StatelessWidget {
  final FilterStore store = GetIt.I<HomeStore>().clonedFilter;

  FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtrar Busca"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  OrderByField(store: store),
                  PriceRangeField(store: store),
                  VendorTypeField(store: store),
                  Observer(
                    builder: (_) {
                      return Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: store.isFormValid
                              ? () {
                                  store.save(store);
                                  Navigator.of(context).pop();
                                }
                              : null,
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Filtrar",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
