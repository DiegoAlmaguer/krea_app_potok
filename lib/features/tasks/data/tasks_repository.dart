import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/task_item.dart';

final tasksRepositoryProvider = Provider<TasksRepository>((ref) => TasksRepository(Supabase.instance.client));

class TasksRepository {
  TasksRepository(this._client);
  final SupabaseClient _client;

  Future<List<TaskItem>> listTasks({String? assigneeId, String? projectId}) async {
    var query = _client.from('tasks').select();
    if (assigneeId != null) query = query.eq('assignee_id', assigneeId);
    if (projectId != null) query = query.eq('project_id', projectId);
    final rows = await query.order('due_date', ascending: true);
    return (rows as List).map((e) => TaskItem.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  Future<void> updateTaskStatus(String taskId, String status) async {
    await _client.from('tasks').update({'status': status}).eq('id', taskId);
  }
}
