import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/components/card/card_empty.dart';
import 'package:xlo_app/components/drawer/custom_drawer.dart';
import 'package:xlo_app/stores/favorite_store.dart';

import 'components/favorite_tile.dart';

class FavoriteScreen extends StatelessWidget {
  final bool hideDrawer;
  final FavoriteStore store = GetIt.I<FavoriteStore>();

  FavoriteScreen({Key? key, this.hideDrawer = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
        centerTitle: true,
      ),
      drawer: hideDrawer ? null : const CustomDrawer(),
      body: Observer(
        builder: (_) {
          if (store.favoriteList.isEmpty) {
            return const CardEmpty(text: "Nenhum anúncio favoritado");
          }
          return ListView.builder(
            padding: const EdgeInsets.all(2),
            itemCount: store.favoriteList.length,
            itemBuilder: (context, index) {
              return FavoriteTile(ad: store.favoriteList[index]);
            },
          );
        },
      ),
    );
  }
}
