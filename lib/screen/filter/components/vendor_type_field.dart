import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screen/filter/components/section_title.dart';
import 'package:xlo_app/stores/filter_store.dart';

class VendorTypeField extends StatelessWidget {
  final FilterStore store;

  const VendorTypeField({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionTitle(title: "Tipo de anúnciante"),
        Observer(
          builder: (_) {
            return Wrap(
              runSpacing: 4,
              children: [
                GestureDetector(
                  onTap: () {
                    if (store.isTypeParticular) {
                      if (store.isTypeProfessional) {
                        store.resetVendorType(vendorTypeParticular);
                      } else {
                        store.selectVendorType(vendorTypeProfessional);
                      }
                    } else {
                      store.setVendorType(vendorTypeParticular);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: store.isTypeParticular
                          ? Colors.purple
                          : Colors.transparent,
                      border: Border.all(
                        color: store.isTypeParticular
                            ? Colors.purple
                            : Colors.grey,
                      ),
                    ),
                    child: Text(
                      "Particular",
                      style: TextStyle(
                        color: store.isTypeParticular
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    if (store.isTypeProfessional) {
                      if (store.isTypeParticular) {
                        store.resetVendorType(vendorTypeProfessional);
                      } else {
                        store.selectVendorType(vendorTypeParticular);
                      }
                    } else {
                      store.setVendorType(vendorTypeProfessional);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: store.isTypeProfessional
                          ? Colors.purple
                          : Colors.transparent,
                      border: Border.all(
                        color: store.isTypeProfessional
                            ? Colors.purple
                            : Colors.grey,
                      ),
                    ),
                    child: Text(
                      "Profissional",
                      style: TextStyle(
                        color: store.isTypeProfessional
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
