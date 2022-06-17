import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/app_ui_config.dart';
import 'package:job_timer/app/models/project_model.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';
import 'package:job_timer/app/modules/home/widgets/custom_drawer.dart';
import 'package:job_timer/app/modules/home/widgets/project_tile.dart';

import 'widgets/custom_menu_header.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;

  const HomePage({super.key, required this.homeController});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeController.loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: widget.homeController,
      listener: (context, state) {
        if (state.status == HomeStatus.error) {
          AsukaSnackbar.alert('Erro Ao Carregar os Projetos').show();
        }
      },
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                expandedHeight: 100,
                toolbarHeight: 100,
                title: Text(AppUiConfig.title),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: CustomMenuHeader(),
                pinned: true,
              ),
              BlocSelector<HomeController, HomeState, List<ProjectModel>>(
                bloc: widget.homeController,
                selector: (state) => state.projects,
                builder: (context, projects) {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ...projects.map(
                            (project) => ProjectTile(projectModel: project)),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
