import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/components/card/card_empty.dart';
import 'package:xlo_app/components/drawer/custom_drawer.dart';
import 'package:xlo_app/stores/home_store.dart';

import 'components/ad_tile.dart';
import 'components/create_ad_button.dart';
import 'components/search_dialog.dart';
import 'components/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;
  final HomeStore store = GetIt.I<HomeStore>();

  openSearch(BuildContext context) async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(
        currentSearch: store.search,
      ),
    );

    if (search != null) {
      store.setSearch(search);
    }
  }

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              if (store.search.isEmpty) {
                return const Text("");
              } else {
                return GestureDetector(
                  onTap: () => openSearch(context),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.biggest.width,
                        child: Text(store.search),
                      );
                    },
                  ),
                );
              }
            },
          ),
          actions: [
            Observer(
              builder: (_) {
                if (store.search.isEmpty) {
                  return IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => openSearch(context),
                  );
                } else {
                  return IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => store.setSearch(""),
                  );
                }
              },
            )
          ],
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            TopBar(),
            Expanded(
              child: Stack(
                children: [
                  Observer(
                    builder: (_) {
                      if (store.errorAd.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.error,
                                color: Colors.white,
                                size: 100,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Ocorreu um erro!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        );
                      } else if (store.showProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (store.adList.isEmpty) {
                        return const CardEmpty(
                            text: "Nenhum anúncio encontrado!");
                      } else {
                        return ListView.builder(
                          controller: scrollController,
                          itemCount: store.itemCount,
                          itemBuilder: (_, index) {
                            if (index < store.adList.length) {
                              return AdTile(ad: store.adList[index]);
                            } else {
                              store.loadNextPage();

                              return Container(
                                height: 10,
                                alignment: Alignment.center,
                                child: LinearProgressIndicator(
                                  color: Colors.purple[600],
                                  backgroundColor: Colors.purple[400],
                                ),
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                  Positioned(
                    bottom: -50,
                    left: 0,
                    right: 0,
                    child: CreateAdButton(scrollController: scrollController),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
