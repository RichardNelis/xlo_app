import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  final String label;
  final int? initialValue;
  final Function(int?) onChanged;

  const PriceField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        initialValue: initialValue?.toString(),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.purple),
          isDense: true,
          prefixText: "R\$ ",
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(),
        ],
        style: const TextStyle(fontSize: 16),
        onChanged: (value) {
          onChanged(int.tryParse(value.replaceAll(".", "")));
        },
      ),
    );
  }
}
