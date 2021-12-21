import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/components/drawer/custom_drawer.dart';
import 'package:xlo_app/screen/edit_account/edit_account_screen.dart';
import 'package:xlo_app/screen/favorite/favorite_screen.dart';
import 'package:xlo_app/screen/my_ads/my_ads_screen.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<UserManagerStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha conta"),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 140,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Observer(
                            builder: (_) {
                              return Text(
                                store.userModel != null
                                    ? store.userModel!.name
                                    : "",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w900,
                                ),
                              );
                            },
                          ),
                          Text(
                            store.userModel!.email,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: MaterialButton(
                        child: const Text(
                          "EDITAR",
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const EditAccountScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  "Meus anúncios",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const MyAdsScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  "Favoritos",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => FavoriteScreen(hideDrawer: true),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
