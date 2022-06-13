import 'package:job_timer/app/models/project_model.dart';
import 'package:job_timer/app/repositories/project/project_repository.dart';

import './project_service.dart';
import '../../entities/project.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepository _projectRepository;

  ProjectServiceImpl({
    required ProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    /// Outra Maneira de Fazer isso
    ///
    /// final project = Project();
    /// project.id = projectModel.id;
    /// project.name = projectModel.name;
    ///

    final project = Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..status = projectModel.status
      ..estimate = projectModel.estimate;

    await _projectRepository.register(project);
  }
}
