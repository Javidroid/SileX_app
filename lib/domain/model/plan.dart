import 'dart:core';

class Plan {
  String idPlan;
  String creatorId;
  String title;
  String description;
  String place;
  DateTime date;
  List<String> categories;
  int maxUsers;
  List<String> joinedUsers;
  String creatorProfPic;

  Plan({
    required this.idPlan,
    required this.creatorId,
    required this.title,
    required this.description,
    required this.place,
    required this.date,
    required this.categories,
    required this.maxUsers,
    required this.joinedUsers,
    this.creatorProfPic = '',
  });
}
