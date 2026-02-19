import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/domain/user_profile.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(Supabase.instance.client));

class AuthRepository {
  AuthRepository(this._client);
  final SupabaseClient _client;

  Stream<AuthState> get authState => _client.auth.onAuthStateChange;

  Future<void> signIn(String email, String password) async {
    await _client.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() => _client.auth.signOut();

  Future<UserProfile?> loadProfile() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    final row = await _client.from('profiles').select('id, email, full_name, role').eq('id', user.id).maybeSingle();
    if (row == null) return null;

    return UserProfile(
      id: row['id'] as String,
      email: row['email'] as String? ?? user.email ?? '',
      fullName: row['full_name'] as String?,
      role: AppRole.values.firstWhere((e) => e.name == (row['role'] as String? ?? 'client'), orElse: () => AppRole.client),
    );
  }
}
