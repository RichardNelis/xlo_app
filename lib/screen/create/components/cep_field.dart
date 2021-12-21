import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/stores/cep_store.dart';
import 'package:xlo_app/stores/create_store.dart';

class CEPField extends StatelessWidget {
  final CreateStore createStore;
  final CEPStore store;

  CEPField({Key? key, required this.createStore})
      : store = createStore.cepStore,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Observer(
          builder: (_) {
            return TextFormField(
              initialValue: store.cep,
              onChanged: store.setCEP,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
              decoration: InputDecoration(
                labelText: 'CEP *',
                errorText: createStore.addressError,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
              ),
            );
          },
        ),
        Observer(
          builder: (_) {
            if (store.address == null &&
                store.error.isEmpty &&
                !store.loading) {
              return Container();
            } else if (store.address == null && store.error.isEmpty) {
              return LinearProgressIndicator(
                color: Colors.purple,
                backgroundColor: Colors.purple[100],
              );
            } else if (store.error.isNotEmpty) {
              return Container(
                color: Colors.red.withAlpha(100),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  store.error,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              );
            } else {
              final a = store.address!;

              return Container(
                color: Colors.purple.withAlpha(150),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  "Localização: ${a.district}, ${a.cityModel.name} - ${a.ufModel.initials}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
