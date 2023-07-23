import 'dart:core';

class Plan {
  String idPlan;
  String creator; // todo check if object or string (and signedUpUsers)
  String title;
  String description;
  String place;
  DateTime date;
  Set<String> categories;
  int maxUsers;
  Set<String> signedUpUser;

  Plan(
    this.idPlan,
    this.creator,
    this.title,
    this.description,
    this.place,
    this.date,
    this.categories,
    this.maxUsers,
    this.signedUpUser,
  );
}
