import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/data/auth_repository.dart';
import '../../auth/domain/user_profile.dart';

final currentProfileProvider = AsyncNotifierProvider<CurrentProfileController, UserProfile?>(CurrentProfileController.new);

class CurrentProfileController extends AsyncNotifier<UserProfile?> {
  @override
  Future<UserProfile?> build() async {
    final repo = ref.read(authRepositoryProvider);
    return repo.loadProfile();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.signIn(email, password);
      return repo.loadProfile();
    });
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
    state = const AsyncData(null);
  }
}
