import '../../features/auth/domain/user_profile.dart';

String roleTitle(AppRole role) {
  switch (role) {
    case AppRole.client:
      return 'Client';
    case AppRole.staff:
      return 'Staff';
    case AppRole.admin:
      return 'Admin';
  }
}
