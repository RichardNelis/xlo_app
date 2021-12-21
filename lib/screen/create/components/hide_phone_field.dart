import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/stores/create_store.dart';

class HidePhoneField extends StatelessWidget {
  final CreateStore store;

  const HidePhoneField({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              Checkbox(
                
                value: store.hidePhone,
                onChanged: (value) => store.setHidePhone(value!),
              ),
              const Expanded(
                child: Text(
                  'Ocultar meu telefone neste anúncio',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
