import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/screen/account/account_screen.dart';
import 'package:xlo_app/screen/create/create_screen.dart';
import 'package:xlo_app/screen/favorite/favorite_screen.dart';
import 'package:xlo_app/screen/home/home_screen.dart';
import 'package:xlo_app/screen/offline/offline_screen.dart';
import 'package:xlo_app/stores/connectivity_store.dart';
import 'package:xlo_app/stores/page_store.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  late PageStore _pageStore;
  late PageController _pageController;
  late ConnectivityStore _connectivityStore;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _pageStore = GetIt.I<PageStore>();
    _connectivityStore = GetIt.I<ConnectivityStore>();

    reaction(
      (_) => _pageStore.page,
      (int page) => _pageController.jumpToPage(page),
    );

    autorun((_) {
      if (!_connectivityStore.isConnected) {
        Future.delayed(const Duration(milliseconds: 50)).then(
          (value) => showDialog(
            context: context,
            builder: (_) {
              return const OfflineScreen();
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          const CreateScreen(ad: null),
          Container(color: Colors.green),
          FavoriteScreen(),
          const AccountScreen(),
        ],
      ),
    );
  }
}
