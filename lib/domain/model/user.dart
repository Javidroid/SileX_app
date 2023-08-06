import 'package:tfg_v2/domain/model/profile.dart';
import 'package:tfg_v2/env/constants.dart';

class User {
  String username;
  String email;
  bool isVerified;
  UserRole userRole;
  Profile profile;

  User(
    this.username,
    this.email,
    this.userRole,
    this.profile, {
    required this.isVerified,
  });
}

enum UserRole { student, moderator, admin }

extension UserRoleToString on UserRole {
  String get string => switch (this) {
        UserRole.admin => Constants.adminRole,
        UserRole.moderator => Constants.moderatorRole,
        UserRole.student => Constants.studentRole,
      };
}
