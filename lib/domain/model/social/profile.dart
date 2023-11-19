class Profile {
  String name;
  String surnames;
  String description;
  DateTime birthDate;
  int age;
  String profilePic;
  Set<String> followers;
  Set<String> following;
  List<String> createdPlansId;
  String university;
  String degree;
  String center;

  Profile({
    required this.name,
    required this.surnames,
    required this.birthDate,
    required this.description,
    required this.age,
    required this.profilePic,
    required this.followers,
    required this.following,
    required this.createdPlansId,
    required this.university,
    required this.degree,
    required this.center,
  });
}
