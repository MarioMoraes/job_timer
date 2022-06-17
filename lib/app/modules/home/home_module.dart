import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';
import 'package:job_timer/app/modules/login/controller/login_controller.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import './home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    BlocBind.lazySingleton((i) => LoginController(authService: i())),
    BlocBind.lazySingleton((i) => HomeController(projectService: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => HomePage(homeController: Modular.get())),
  ];
}
