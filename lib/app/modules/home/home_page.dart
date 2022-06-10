import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_ui_config.dart';
import 'package:job_timer/app/modules/home/widgets/custom_drawer.dart';

import 'widgets/custom_menu_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SliverList(
              delegate: SliverChildListDelegate(
                [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
