import 'dart:core';

class Plan {
  String idPlan;
  String creator; // todo check if object or string (and signedUpUsers)
  String title;
  String description;
  String place;
  DateTime date;
  List<String> categories;
  int joinedUsers;
  int maxUsers;
  List<String> signedUpUsers;

  Plan({
    required this.idPlan,
    required this.creator,
    required this.title,
    required this.description,
    required this.place,
    required this.date,
    required this.categories,
    required this.joinedUsers,
    required this.maxUsers,
    required this.signedUpUsers,
  });
}
