import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screen/login/login_screen.dart';
import 'package:xlo_app/stores/page_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserManagerStore store = GetIt.I<UserManagerStore>();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();

        if (store.isLoggedIn) {
          GetIt.I<PageStore>().setPage(4);
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const LoginScreen(),
            ),
          );
        }
      },
      child: Container(
        height: 95,
        color: Colors.purple,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    store.isLoggedIn
                        ? store.userModel!.name
                        : "Acesse sua conta agora!",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    store.isLoggedIn ? store.userModel!.email : "Clique aqui!",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
