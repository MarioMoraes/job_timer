import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../login/controller/login_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Column(
        children: [
          ListTile(
            onTap: () {
              Modular.get<LoginController>().signOut();
            },
            title: const Text('Sair'),
          )
        ],
      )),
    );
  }
}
