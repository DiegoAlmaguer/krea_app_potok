import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/admin_home_page.dart';
import '../../features/auth/domain/user_profile.dart';
import '../../features/auth/presentation/auth_controller.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/client/presentation/client_home_page.dart';
import '../../features/staff/presentation/staff_home_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      GoRoute(path: '/client', builder: (_, __) => const ClientHomePage()),
      GoRoute(path: '/staff', builder: (_, __) => const StaffHomePage()),
      GoRoute(path: '/admin', builder: (_, __) => const AdminHomePage()),
    ],
    redirect: (_, state) {
      final profile = ref.read(currentProfileProvider).valueOrNull;
      final atLogin = state.matchedLocation == '/login';
      if (profile == null) return atLogin ? null : '/login';

      final destination = switch (profile.role) {
        AppRole.client => '/client',
        AppRole.staff => '/staff',
        AppRole.admin => '/admin',
      };

      if (atLogin || state.matchedLocation != destination) return destination;
      return null;
    },
  );
});
