import 'package:tfg_v2/data/dto/profile_dto.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/env/constants.dart';

class UserDto {
  String username;
  String email;
  bool isVerified;
  String userRole;
  ProfileDto profile;

  UserDto({
    required this.username,
    required this.email,
    required this.isVerified,
    required this.userRole,
    required this.profile,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      username: json["username"],
      email: json["email"],
      isVerified: json["is_verified"].toLowerCase() == 'true',
      userRole: json["role"],
      profile: ProfileDto.fromJson(json["profile"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "is_verified": isVerified,
      "role": userRole,
      "profile": profile.toJson(),
    };
  }

  User toModel() {
    return User(
      username,
      email,
      switch (userRole) {
        Constants.studentRole => UserRole.student,
        Constants.moderatorRole => UserRole.moderator,
        Constants.adminRole => UserRole.admin,
        _ => UserRole.student,
      },
      profile.toModel(),
      isVerified: isVerified,
    );
  }
}
