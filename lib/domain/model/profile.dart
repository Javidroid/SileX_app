class Profile {
  String name;
  String surnames;
  DateTime birthDate;
  int age;
  String profilePic;
  Set<String> followers;
  Set<String> following;
  List<String> createdPlansId;
  String idUniversity;
  String idDegree;
  String idCenter;

  Profile({
    required this.name,
    required this.surnames,
    required this.birthDate,
    required this.age,
    required this.profilePic,
    required this.followers,
    required this.following,
    required this.createdPlansId,
    required this.idUniversity,
    required this.idDegree,
    required this.idCenter,
  });
}
