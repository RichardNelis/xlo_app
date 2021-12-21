import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screen/create/components/image_source_modal.dart';
import 'package:xlo_app/stores/create_store.dart';

import 'image_dialog.dart';

class ImagesField extends StatelessWidget {
  final CreateStore store;

  const ImagesField({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      store.images.add(image);
      Navigator.of(context).pop();
    }

    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          height: 120,
          child: Observer(
            builder: (_) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: store.images.length < 5
                    ? store.images.length + 1
                    : store.images.length,
                itemBuilder: (_, index) {
                  if (index == store.images.length) {
                    return GestureDetector(
                      onTap: () {
                        if (Platform.isAndroid) {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => ImageSourceModal(
                                onImageSelected: onImageSelected),
                          );
                        } else {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) => ImageSourceModal(
                                onImageSelected: onImageSelected),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                        child: CircleAvatar(
                          radius: 44,
                          backgroundColor: Colors.grey[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => ImageDialog(
                            image: store.images[index],
                            onDelete: () {
                              store.images.removeAt(index);
                            },
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(8, 8, index == 4 ? 8 : 0, 8),
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage: imageWidget(store.images[index]),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
        Observer(
          builder: (_) {
            if (store.imageError.isNotEmpty) {
              return Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                child: Text(
                  store.imageError,
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

  ImageProvider<Object> imageWidget(image) {
    if (image is File) {
      return FileImage(image);
    } else {
      return NetworkImage(image);
    }
  }
}
