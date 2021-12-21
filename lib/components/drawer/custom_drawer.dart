import 'package:flutter/material.dart';

import 'custom_drawer_header.dart';
import 'page_section.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
        width: size.width * 0.65,
        child: Drawer(
          child: ListView(
            children: const [
              CustomDrawerHeader(),
              PageSection(),
            ],
          ),
        ),
      ),
    );
  }
}
