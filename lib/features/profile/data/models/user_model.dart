class UserModel {
  final int id, recipesCount, followingCount, followerCount;
  final String profilePhoto, username, presentation, surname,name;

  UserModel({
    required this.id,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
    required this.profilePhoto,
    required this.username,
    required this.presentation,
    required this.name,
    required this.surname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      recipesCount: json["recipesCount"],
      followingCount: json["followingCount"],
      followerCount: json["followerCount"],
      profilePhoto: json["profilePhoto"],
      username: json["username"],
      presentation: json["presentation"],
      name: json["firstName"],
      surname: json["lastName"],
    );
  }
}
