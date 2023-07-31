import 'package:tfg_v2/domain/model/profile.dart';
import 'package:tfg_v2/utils/age_calculator.dart';

class ProfileDto {
  String name;
  String surnames;
  DateTime birthDate;
  String profilePic;
  List<String> followers;
  List<String> following;
  List<String> createdPlansId;
  String idUniversity;
  String idDegree;
  String idCenter;

  ProfileDto({
    required this.name,
    required this.surnames,
    required this.birthDate,
    required this.profilePic,
    required this.followers,
    required this.following,
    required this.createdPlansId,
    required this.idUniversity,
    required this.idDegree,
    required this.idCenter,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) {
    return ProfileDto(
      name: json["name"],
      surnames: json["surnames"],
      birthDate: DateTime.parse(json["birth_date"]),
      profilePic: json["profile_pic"],
      followers: List<String>.from(json["followers"].map((x) => x)),
      following: List<String>.from(json["following"].map((x) => x)),
      createdPlansId: List<String>.from(json["plans_id"].map((x) => x)),
      idUniversity: json["id_university"],
      idDegree: json["id_degree"],
      idCenter: json["id_center"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surnames": surnames,
      "birth_date": birthDate.toIso8601String(),
      "profile_pic": profilePic,
      "followers": List<dynamic>.from(followers.map((x) => x)),
      "following": List<dynamic>.from(following.map((x) => x)),
      "plans_id": List<dynamic>.from(createdPlansId.map((x) => x)),
      "id_university": idUniversity,
      "id_degree": idDegree,
      "id_center": idCenter,
    };
  }

  Profile toModel() {
    return Profile(
      name: name,
      surnames: surnames,
      birthDate: birthDate,
      age: AgeCalculatorUtil.getAgeFromBirthDate(birthDate),
      profilePic: profilePic,
      followers: followers.toSet(),
      following: following.toSet(),
      createdPlansId: createdPlansId,
      idUniversity: idUniversity,
      idDegree: idDegree,
      idCenter: idCenter,
    );
  }
}
