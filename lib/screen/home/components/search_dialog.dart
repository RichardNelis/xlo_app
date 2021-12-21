import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  final String currentSearch;
  final TextEditingController textController;

  SearchDialog({Key? key, required this.currentSearch})
      : textController = TextEditingController(
          text: currentSearch,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: textController,
              textInputAction: TextInputAction.search,
              autofocus: true,
              onSubmitted: (value) {
                Navigator.of(context).pop(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey[700],
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: textController.clear,
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
