enum ProjectStatus {
  andamento(label: 'Em Andamento'),
  finalizado(label: 'Finalizado');

  final String label;
  const ProjectStatus({required this.label});
}