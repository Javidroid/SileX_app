import 'dart:core';

class Plan {
  String idPlan;
  String creator; // todo check if object or string (and signedUpUsers)
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
    required this.creator,
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