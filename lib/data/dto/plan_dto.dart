import 'package:tfg_v2/domain/model/plan.dart';

class PlanDto {
  String idPlan;
  String creatorUser;
  String title;
  String description;
  String place;
  DateTime date;
  List<String> categories;
  int maxUsers;
  List<String> signedUpUsers;

  PlanDto({
    required this.idPlan,
    required this.creatorUser,
    required this.title,
    required this.description,
    required this.place,
    required this.date,
    required this.categories,
    required this.maxUsers,
    required this.signedUpUsers,
  });

  factory PlanDto.fromJson(Map<String, dynamic> json) {
    return PlanDto(
      idPlan: json["_id"],
      creatorUser: json["creator_user"],
      title: json["title"],
      description: json["description"],
      place: json["place"],
      date: DateTime.parse(json["date"]),
      categories: List.from(json["categories"].map((x) => x)),
      maxUsers: json["max_users"],
      signedUpUsers: List.from(json["signed_up_users"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": idPlan,
      "creator_user": creatorUser,
      "title": title,
      "description": description,
      "place": place,
      "date": date.toIso8601String(),
      "categories": List<dynamic>.from(categories.map((x) => x)),
      "max_users": maxUsers,
      "signed_up_users": List<dynamic>.from(signedUpUsers.map((x) => x)),
    };
  }

  Plan toModel() {
    return Plan(
      idPlan: idPlan,
      creator: creatorUser,
      title: title,
      description: description,
      place: place,
      date: date,
      categories: categories,
      joinedUsers: signedUpUsers.length,
      maxUsers: maxUsers,
      signedUpUser: signedUpUsers,
    );
  }
}
