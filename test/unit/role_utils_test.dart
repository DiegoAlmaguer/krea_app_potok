import 'package:flutter_test/flutter_test.dart';
import 'package:kreatrivpotok_app_v2/core/utils/role_utils.dart';
import 'package:kreatrivpotok_app_v2/features/auth/domain/user_profile.dart';

void main() {
  test('roleTitle returns readable names', () {
    expect(roleTitle(AppRole.client), 'Client');
    expect(roleTitle(AppRole.staff), 'Staff');
    expect(roleTitle(AppRole.admin), 'Admin');
  });
}
