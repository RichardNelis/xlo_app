import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/models/ad_model.dart';
import 'package:xlo_app/stores/favorite_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

import 'components/bottom_bar.dart';
import 'components/description_panel.dart';
import 'components/location_panel.dart';
import 'components/main_panel.dart';
import 'components/user_panel.dart';

class AdScreen extends StatelessWidget {
  final AdModel ad;
  final UserManagerStore userStore = GetIt.I<UserManagerStore>();
  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  AdScreen({Key? key, required this.ad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Anúncio"),
        centerTitle: true,
        actions: [
          Observer(
            builder: (_) {
              if (ad.status == AdStatus.active && userStore.isLoggedIn) {
                return IconButton(
                  onPressed: () => favoriteStore.toggleFavorite(ad),
                  icon: Icon(
                    favoriteStore.favoriteList.any((element) => element.id == ad.id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 280,
                child: CarouselSlider(
                  options: CarouselOptions(
                    disableCenter: true,
                    viewportFraction: 1.0,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: ad.images
                      .map(
                        (url) => CachedNetworkImage(
                          imageUrl: url,
                          height: 280,
                          fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainPanel(ad: ad),
                    Divider(color: Colors.grey[500]),
                    DescriptionPanel(ad: ad),
                    Divider(color: Colors.grey[500]),
                    LocationPanel(ad: ad),
                    Divider(color: Colors.grey[500]),
                    UserPanel(ad: ad),
                    SizedBox(height: ad.status == AdStatus.pending ? 16 : 110),
                  ],
                ),
              )
            ],
          ),
          BottomBar(ad: ad),
        ],
      ),
    );
  }
}
