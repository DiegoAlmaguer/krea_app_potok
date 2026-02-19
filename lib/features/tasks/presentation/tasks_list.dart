import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/state_widgets.dart';
import '../data/tasks_repository.dart';
import '../domain/task_item.dart';

final tasksProvider = FutureProvider.autoDispose<List<TaskItem>>((ref) {
  final repo = ref.read(tasksRepositoryProvider);
  return repo.listTasks();
});

class TasksList extends ConsumerWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tasksProvider);
    return state.when(
      loading: () => const AppSkeletonList(),
      error: (_, __) => const Center(child: Text('Failed to load tasks')),
      data: (tasks) {
        if (tasks.isEmpty) return const EmptyState(message: 'No assigned tasks');
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, i) {
            final t = tasks[i];
            return Card(
              child: ListTile(
                title: Text(t.title),
                subtitle: Text('Status: ${t.status}'),
                trailing: PopupMenuButton<String>(
                  onSelected: (v) => ref.read(tasksRepositoryProvider).updateTaskStatus(t.id, v),
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: 'todo', child: Text('To do')),
                    PopupMenuItem(value: 'in_progress', child: Text('In progress')),
                    PopupMenuItem(value: 'done', child: Text('Done')),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
