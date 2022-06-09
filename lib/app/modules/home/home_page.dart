import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_ui_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
        ],
      ),
    );
  }
}
