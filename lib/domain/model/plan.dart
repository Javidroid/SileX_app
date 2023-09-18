import 'dart:core';

class Plan {
  final String idPlan;
  final String creatorId;
  final String title;
  final String description;
  final String place;
  final DateTime date;
  final List<String> categories;
  final int maxUsers;
  final List<String> joinedUsers;
  final String creatorProfPic;

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

  factory Plan.createPlan({
    required title,
    required description,
    required place,
    required date,
    required categories,
    required maxUsers,
  }) {
    return Plan(
      idPlan: '',
      creatorId: '',
      title: title,
      description: description,
      place: place,
      date: date,
      categories: categories,
      maxUsers: maxUsers,
      joinedUsers: [],
    );
  }

  void joinOrQuitUserToPlan({required String userId, required bool isJoin}) {
    if (isJoin) {
      if (!joinedUsers.contains(userId)) joinedUsers.add(userId);
    } else {
      if (joinedUsers.contains(userId)) joinedUsers.remove(userId);
    }
  }
}
