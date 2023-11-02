import 'package:tfg_v2/data/dto/profile_dto.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/env/constants.dart';
import 'package:tfg_v2/utils/datetime_utils.dart';

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

class UserCreateDto {
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

  UserCreateDto({
    required this.username,
    required this.email,
    required this.name,
    required this.surnames,
    required this.description,
    required this.birthDate,
    required this.profilePic,
    required this.university,
    required this.degree,
    required this.center,
  });

  factory UserCreateDto.fromModel(UserCreate user) {
    return UserCreateDto(
      username: user.username,
      email: user.email,
      name: user.name,
      surnames: user.surnames,
      description: user.description,
      birthDate: user.birthDate,
      profilePic: user.profilePic,
      university: user.university,
      degree: user.degree,
      center: user.center,
    );
  }

  // When calling createUser, username is sent on path
  Map<String, dynamic> toCreateUserJson() {
    return {
      "email": email,
      "name": name,
      "surnames": surnames,
      "description": description,
      "birth_date": DateTimeUtils.toApiFormat(birthDate),
      "profile_pic": profilePic,
      "id_university": university,
      "id_degree": degree,
      "id_center": center,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "name": name,
      "surnames": surnames,
      "description": description,
      "birth_date": DateTimeUtils.toApiFormat(birthDate),
      "profile_pic": profilePic,
      "id_university": university,
      "id_degree": degree,
      "id_center": center,
    };
  }
}
