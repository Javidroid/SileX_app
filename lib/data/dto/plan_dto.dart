import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/utils/url_parser.dart';

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
  String creatorProfPic;

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
    required this.creatorProfPic,
  });

  factory PlanDto.fromJson(Map<String, dynamic> json) {
    return PlanDto(
      idPlan: json["_id"],
      creatorUser: json["creator_user"],
      title: UrlParserUtil.tryDecodeUrl(json["title"]),
      description: UrlParserUtil.tryDecodeUrl(json["description"]),
      place: UrlParserUtil.tryDecodeUrl(json["place"]),
      date: DateTime.parse(json["date"]),
      categories: List.from(json["categories"].map((x) => x)),
      maxUsers: json["max_users"],
      signedUpUsers: List.from(json["signed_up_users"].map((x) => x)),
      creatorProfPic: json["creator_profile_pic"],
    );
  }

  Map<String, dynamic> toCreatePlanJson() {
    return {
      "title": Uri.encodeComponent(title),
      "description": Uri.encodeComponent(description),
      "place": Uri.encodeComponent(place),
      "date": date.toIso8601String(),
      "categories": List<dynamic>.from(categories.map((x) => x)),
      "max_users": maxUsers,
    };
  }

  factory PlanDto.fromModel(Plan model) {
    return PlanDto(
      idPlan: model.idPlan,
      creatorUser: model.creatorId,
      title: model.title,
      description: model.description,
      place: model.place,
      date: model.date,
      categories: model.categories,
      maxUsers: model.maxUsers,
      signedUpUsers: model.joinedUsers,
      creatorProfPic: model.creatorProfPic,
    );
  }

  Plan toModel() {
    return Plan(
      idPlan: idPlan,
      creatorId: creatorUser,
      title: title,
      description: description,
      place: place,
      date: date,
      categories: categories,
      maxUsers: maxUsers,
      joinedUsers: signedUpUsers,
      creatorProfPic: creatorProfPic,
    );
  }
}
