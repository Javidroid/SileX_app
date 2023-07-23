import 'dart:core';

import 'package:tfg_v2/domain/model/user.dart';

class Plan {
  String idPlan;
  User creator; // todo check if object or string (and signedUpUsers)
  String title;
  String description;
  String place;
  DateTime date;
  Set<String> categories;
  int maxUsers;
  Set<User> signedUpUser;

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
