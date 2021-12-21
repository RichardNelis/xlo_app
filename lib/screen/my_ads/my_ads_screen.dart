import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/components/card/card_empty.dart';

import 'package:xlo_app/stores/my_ads_store.dart';

import 'components/active_tile.dart';
import 'components/pending_tile.dart';
import 'components/sold_tile.dart';

enum TabPage { active, pending, sold }

class MyAdsScreen extends StatefulWidget {
  final TabPage? initialPage;

  const MyAdsScreen({Key? key, this.initialPage}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late MyAdsStore _store;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: widget.initialPage?.index ?? 0,
    );

    _store = MyAdsStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus anúncios"),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text("ATIVOS"),
            ),
            Tab(
              child: Text("PENDENTES"),
            ),
            Tab(
              child: Text("VENDIDOS"),
            ),
          ],
        ),
      ),
      body: Observer(
        builder: (_) {
          if (_store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return TabBarView(
            controller: _tabController,
            children: [
              Observer(
                builder: (_) {
                  if (_store.activeAds.isEmpty) {
                    return const CardEmpty(
                      text: "Você não possui nenhum anúncio ativo",
                    );
                  } else {
                    return ListView.builder(
                      itemCount: _store.activeAds.length,
                      itemBuilder: (context, index) {
                        return ActiveTile(
                          ad: _store.activeAds[index],
                          store: _store,
                        );
                      },
                    );
                  }
                },
              ),
              Observer(
                builder: (_) {
                  if (_store.pendingAds.isEmpty) {
                    return const CardEmpty(
                      text: "Você não possui nenhum anúncio pendente",
                    );
                  } else {
                    return ListView.builder(
                      itemCount: _store.pendingAds.length,
                      itemBuilder: (context, index) {
                        return PendingTile(ad: _store.pendingAds[index]);
                      },
                    );
                  }
                },
              ),
              Observer(
                builder: (_) {
                  if (_store.soldAds.isEmpty) {
                    return const CardEmpty(
                      text: "Você não possui nenhum anúncio vendido",
                    );
                  } else {
                    return ListView.builder(
                      itemCount: _store.soldAds.length,
                      itemBuilder: (context, index) {
                        return SoldTile(
                          ad: _store.soldAds[index],
                          store: _store,
                        );
                      },
                    );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
