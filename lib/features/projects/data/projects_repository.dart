import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/project.dart';

final projectsRepositoryProvider = Provider<ProjectsRepository>((ref) => ProjectsRepository(Supabase.instance.client));

class ProjectsRepository {
  ProjectsRepository(this._client);
  final SupabaseClient _client;

  Future<List<Project>> listProjects({String? clientId, String? staffId}) async {
    var query = _client.from('projects').select();
    if (clientId != null) query = query.eq('client_id', clientId);
    if (staffId != null) query = query.eq('staff_id', staffId);
    final rows = await query.order('created_at', ascending: false);
    return (rows as List).map((e) => Project.fromJson(Map<String, dynamic>.from(e))).toList();
  }
}
