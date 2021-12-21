import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screen/login/login_screen.dart';
import 'package:xlo_app/stores/page_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

import 'page_tile.dart';

class PageSection extends StatefulWidget {
  const PageSection({Key? key}) : super(key: key);

  @override
  State<PageSection> createState() => _PageSectionState();
}

class _PageSectionState extends State<PageSection> {
  late PageStore _pageStore;
  late UserManagerStore _userManagerStore;

  Future<void> verifyLoginAndSetPage(int page) async {
    if (_userManagerStore.isLoggedIn) {
      _pageStore.setPage(page);
    } else {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );

      if (result != null && result) {
        _pageStore.setPage(page);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _pageStore = GetIt.I<PageStore>();
    _userManagerStore = GetIt.I<UserManagerStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            verifyLoginAndSetPage(0);
          },
          highlighted: _pageStore.page == 0,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () {
            verifyLoginAndSetPage(1);
          },
          highlighted: _pageStore.page == 1,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {
            verifyLoginAndSetPage(2);
          },
          highlighted: _pageStore.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {
            verifyLoginAndSetPage(3);
          },
          highlighted: _pageStore.page == 3,
        ),
        PageTile(
          label: 'Minha Conta',
          iconData: Icons.person,
          onTap: () {
            verifyLoginAndSetPage(4);
          },
          highlighted: _pageStore.page == 4,
        ),
      ],
    );
  }
}
