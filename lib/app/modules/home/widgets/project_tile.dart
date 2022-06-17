import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/job_timer_icons_icons.dart';
import '../../../models/project_model.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel projectModel;

  const ProjectTile({
    super.key,
    required this.projectModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Modular.to.pushNamed(
          '/project/detail',
          arguments: projectModel,
        );
        // Modular.get<HomeController>().updateList();
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 90),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 4,
          ),
        ),
        child: Column(
          children: [
            _ProjectName(projectModel: projectModel),
            Expanded(
              child: _ProjectProgress(projectModel: projectModel),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectName extends StatelessWidget {
  final ProjectModel projectModel;
  const _ProjectName({required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            projectModel.name,
            style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500),
          ),
          Icon(
            JobTimerIcons.angle_double_right,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}

class _ProjectProgress extends StatelessWidget {
  final ProjectModel projectModel;
  const _ProjectProgress({required this.projectModel});

  @override
  Widget build(BuildContext context) {
    final totalTasks = projectModel.tasks
        .fold<int>(0, (previousValue, task) => previousValue += task.duration);
    var percent = 0.0;
    if (totalTasks > 0) {
      percent = totalTasks / projectModel.estimate;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300]!,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: TweenAnimationBuilder<double>(
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.grey[400]!,
                  color: Colors.blue,
                );
              },
              duration: const Duration(seconds: 2),
              tween: Tween(
                begin: 0.0,
                end: percent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text('${projectModel.estimate}h'),
          )
        ],
      ),
    );
  }
}
