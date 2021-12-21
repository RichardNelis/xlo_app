import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  final String label;
  final BoxDecoration decoration;
  final VoidCallback onTap;

  const BarButton({Key? key, required this.label, required this.decoration, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: decoration,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
