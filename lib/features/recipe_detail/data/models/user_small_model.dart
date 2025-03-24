class UserSmallModel {
  final int id;
  final String username, surname, name, profilePhoto;

  UserSmallModel({
    required this.id,
    required this.username,
    required this.surname,
    required this.name,
    required this.profilePhoto,
  });

  factory UserSmallModel.fromJson(Map<String, dynamic> json) {
    return UserSmallModel(
      id: json["id"],
      username: json["username"],
      surname: json["lastName"],
      name: json["firstName"],
      profilePhoto: json["profilePhoto"],
    );
  }
}
