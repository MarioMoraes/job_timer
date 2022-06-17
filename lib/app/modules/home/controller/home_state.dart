part of 'home_controller.dart';

enum HomeStatus {
  initial,
  loading,
  completed,
  error,
}

class HomeState extends Equatable {
  final List<ProjectModel> projects;
  final HomeStatus status;
  final ProjectStatus projectStatus;

  const HomeState._({
    required this.projects,
    required this.status,
    required this.projectStatus,
  });

  HomeState.initial()
      : this._(
            projects: [],
            status: HomeStatus.initial,
            projectStatus: ProjectStatus.andamento);

  @override
  List<Object?> get props => [projects, status, projectStatus];

  HomeState copyWith({
    List<ProjectModel>? projects,
    HomeStatus? status,
    ProjectStatus? projectStatus,
  }) {
    return HomeState._(
      projects: projects ?? this.projects,
      status: status ?? this.status,
      projectStatus: projectStatus ?? this.projectStatus,
    );
  }
}
