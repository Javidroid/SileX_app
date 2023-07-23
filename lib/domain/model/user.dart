import 'package:tfg_v2/domain/model/profile.dart';

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