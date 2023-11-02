import 'package:tfg_v2/domain/model/profile.dart';
import 'package:tfg_v2/env/constants.dart';

/// The class that is used within the app. Holds all the information
class User {
  String id;
  String username;
  String email;
  bool isVerified;
  UserRole userRole;
  Profile profile;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.userRole,
    required this.profile,
    required this.isVerified,
  });
}

/// Possible roles an [User] can have
enum UserRole { student, moderator, admin }

extension UserRoleToString on UserRole {
  String get string => switch (this) {
        UserRole.admin => Constants.adminRole,
        UserRole.moderator => Constants.moderatorRole,
        UserRole.student => Constants.studentRole,
      };
}

/// It is only used when a new user is about to be created.
/// It only has the info that a person can provide. (For example, it shouldn't
/// hold internal data like followers, plan id's...)
class UserCreate {
  String username;
  String email;
  String name;
  String surnames;
  String description;
  DateTime birthDate;
  String profilePic;
  String university;
  String degree;
  String center;

  UserCreate({
    required this.username,
    required this.email,
    required this.name,
    required this.surnames,
    required this.description,
    required this.birthDate,
    this.profilePic = '',
    required this.university,
    required this.degree,
    required this.center,
  });
}
