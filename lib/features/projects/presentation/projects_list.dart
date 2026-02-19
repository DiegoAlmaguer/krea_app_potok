import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/state_widgets.dart';
import '../../projects/data/projects_repository.dart';
import '../../projects/domain/project.dart';

final projectsProvider = FutureProvider.autoDispose.family<List<Project>, String>((ref, roleMode) {
  final repo = ref.read(projectsRepositoryProvider);
  return repo.listProjects();
});

class ProjectsList extends ConsumerWidget {
  const ProjectsList({super.key, required this.roleMode});
  final String roleMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(projectsProvider(roleMode));
    return state.when(
      loading: () => const AppSkeletonList(),
      error: (_, __) => const Center(child: Text('Failed to load projects')),
      data: (items) {
        if (items.isEmpty) return const EmptyState(message: 'No projects yet');
        return ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, i) {
            final p = items[i];
            return ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              title: Text(p.title),
              subtitle: Text(p.description ?? '—'),
              trailing: Chip(label: Text(p.status)),
            );
          },
        );
      },
    );
  }
}
