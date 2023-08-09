import 'package:tfg_v2/data/dto/profile_dto.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/env/constants.dart';

class UserDto {
  String id;
  String username;
  String email;
  bool isVerified;
  String userRole;
  ProfileDto profile;

  UserDto({
    required this.id,
    required this.username,
    required this.email,
    required this.isVerified,
    required this.userRole,
    required this.profile,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['_id'],
      username: json["username"],
      email: json["email"],
      isVerified: json["is_verified"],
      userRole: json["role"],
      profile: ProfileDto.fromJson(json["profile"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "username": username,
      "email": email,
      "is_verified": isVerified,
      "role": userRole,
      "profile": profile.toJson(),
    };
  }

  factory UserDto.fromModel(User user) {
    return UserDto(
      id: user.id,
      username: user.username,
      email: user.email,
      isVerified: user.isVerified,
      userRole: user.userRole.string,
      profile: ProfileDto.fromModel(user.profile),
    );
  }

  User toModel() {
    return User(
      id: id,
      username: username,
      email: email,
      userRole: switch (userRole) {
        Constants.studentRole => UserRole.student,
        Constants.moderatorRole => UserRole.moderator,
        Constants.adminRole => UserRole.admin,
        _ => UserRole.student,
      },
      profile: profile.toModel(),
      isVerified: isVerified,
    );
  }
}
