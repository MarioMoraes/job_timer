import 'package:job_timer/app/models/project_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectModel projectModel);
}
