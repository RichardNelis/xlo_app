import 'dart:io';

import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final dynamic image;
  final VoidCallback onDelete;

  const ImageDialog({Key? key, required this.image, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 280,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageWidget(image),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
            child: const Text(
              "Excluir",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }

  ImageProvider<Object> imageWidget(image) {
    if (image is File) {
      return FileImage(image);
    } else {
      return NetworkImage(image);
    }
  }
}
