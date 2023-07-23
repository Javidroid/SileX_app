import 'package:tfg_v2/domain/model/plan.dart';

class PlanDto {
  String idPlan;
  String creator;
  String title;
  String description;
  String place;
  DateTime date;
  List<String> categories;
  int maxUsers;
  List<String> signedUpUser;

  PlanDto({
    required this.idPlan,
    required this.creator,
    required this.title,
    required this.description,
    required this.place,
    required this.date,
    required this.categories,
    required this.maxUsers,
    required this.signedUpUser,
  });

  factory PlanDto.fromJson(Map<String, dynamic> json) {
    return PlanDto(
      idPlan: json["id_plan"],
      creator: json["creator_id"],
      title: json["title"],
      description: json["description"],
      place: json["place"],
      date: DateTime.parse(json["date"]),
      categories: List<String>.from(json["categories"].map((x) => x)),
      maxUsers: int.parse(json["max_users"]),
      signedUpUser: List<String>.from(json["signed_up_users"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_plan": idPlan,
      "creator_id": creator,
      "title": title,
      "description": description,
      "place": place,
      "date": date.toIso8601String(),
      "categories": List<dynamic>.from(categories.map((x) => x)),
      "max_users": maxUsers,
      "signed_up_users": List<dynamic>.from(signedUpUser.map((x) => x)),
    };
  }

  Plan toModel() {
    return Plan(
      idPlan,
      creator,
      title,
      description,
      place,
      date,
      categories.toSet(),
      maxUsers,
      signedUpUser.toSet(),
    );
  }
}
