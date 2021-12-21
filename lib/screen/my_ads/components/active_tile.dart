import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xlo_app/helpers/extensions.dart';

import 'package:xlo_app/models/ad_model.dart';
import 'package:xlo_app/screen/ad/ad_screen.dart';
import 'package:xlo_app/screen/create/create_screen.dart';
import 'package:xlo_app/stores/my_ads_store.dart';

class ActiveTile extends StatelessWidget {
  final AdModel ad;
  final MyAdsStore store;

  final List<MenuChoice> choices = [
    MenuChoice(0, "Editar", Icons.edit),
    MenuChoice(1, "Já vendi", Icons.thumb_up),
    MenuChoice(2, "Excluir", Icons.delete),
  ];

  ActiveTile({Key? key, required this.ad, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AdScreen(ad: ad),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: ad.images.first,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ad.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ad.price.formattedMoney(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "${ad.views} visitas",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: PopupMenuButton<MenuChoice>(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.purple,
                  ),
                  onSelected: (choice) {
                    switch (choice.index) {
                      case 0:
                        editAd(context);
                        break;
                      case 1:
                        soldAd(context);
                        break;
                      case 2:
                        deleteAd(context);
                        break;
                    }
                  },
                  iconSize: 20,
                  itemBuilder: (_) => choices
                      .map(
                        (choice) => PopupMenuItem<MenuChoice>(
                          child: Row(
                            children: [
                              Icon(
                                choice.iconData,
                                size: 20,
                                color: Colors.purple,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                choice.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.purple,
                                ),
                              )
                            ],
                          ),
                          value: choice,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editAd(BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CreateScreen(ad: ad),
      ),
    );

    if (success != null && success) {
      store.refresh();
    }
  }

  Future<void> soldAd(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Vendido"),
          content: Text("Confirmar a venda de ${ad.title}?"),
          actions: [
            MaterialButton(
              onPressed: Navigator.of(context).pop,
              child: const Text(
                "Não",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
                store.soldAd(ad);
              },
              child: const Text(
                "Sim",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteAd(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Excluir"),
          content: Text("Confirmar a exclusão de ${ad.title}?"),
          actions: [
            MaterialButton(
              onPressed: Navigator.of(context).pop,
              child: const Text(
                "Não",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
                store.deleteAd(ad);
              },
              child: const Text(
                "Sim",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MenuChoice {
  final int index;
  final String title;
  final IconData iconData;

  MenuChoice(this.index, this.title, this.iconData);
}
