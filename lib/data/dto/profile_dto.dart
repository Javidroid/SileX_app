import 'package:tfg_v2/domain/model/profile.dart';
import 'package:tfg_v2/utils/datetime_utils.dart';

class ProfileDto {
  String name;
  String surnames;
  String description;
  DateTime birthDate;
  String profilePic;
  List<String> followers;
  List<String> following;
  List<String> createdPlansId;
  String university;
  String degree;
  String center;

  ProfileDto({
    required this.name,
    required this.surnames,
    required this.description,
    required this.birthDate,
    required this.profilePic,
    required this.followers,
    required this.following,
    required this.createdPlansId,
    required this.university,
    required this.degree,
    required this.center,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) {
    return ProfileDto(
      name: json["name"],
      surnames: json["surnames"],
      description: json["description"],
      birthDate: DateTime.parse(json["birth_date"]),
      profilePic: json["profile_pic"],
      followers: List<String>.from(json["followers"].map((x) => x)),
      following: List<String>.from(json["following"].map((x) => x)),
      createdPlansId: List<String>.from(json["plans_id"].map((x) => x)),
      university: json["university"],
      degree: json["degree"],
      center: json["center"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surnames": surnames,
      "description": description,
      "birth_date": birthDate.toIso8601String(),
      "profile_pic": profilePic,
      "followers": List<dynamic>.from(followers.map((x) => x)),
      "following": List<dynamic>.from(following.map((x) => x)),
      "plans_id": List<dynamic>.from(createdPlansId.map((x) => x)),
      "university": university,
      "degree": degree,
      "center": center,
    };
  }

  factory ProfileDto.fromModel(Profile profile) {
    return ProfileDto(
      name: profile.name,
      surnames: profile.surnames,
      description: profile.description,
      birthDate: profile.birthDate,
      profilePic: profile.profilePic,
      followers: profile.followers.toList(),
      following: profile.following.toList(),
      createdPlansId: profile.createdPlansId,
      university: profile.university,
      degree: profile.degree,
      center: profile.center,
    );
  }

  Profile toModel() {
    return Profile(
      name: name,
      surnames: surnames,
      description: description,
      birthDate: birthDate,
      age: DateTimeUtils.getAgeFromBirthDate(birthDate),
      profilePic: profilePic,
      followers: followers.toSet(),
      following: following.toSet(),
      createdPlansId: createdPlansId,
      university: university,
      degree: degree,
      center: center,
    );
  }
}
