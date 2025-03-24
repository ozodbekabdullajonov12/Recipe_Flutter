class TopChefModel {
  final int id;
  final String username;
  final String firstName, lastName;
  final String image;

  TopChefModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.image,
  });

  factory TopChefModel.fromJson(Map<String, dynamic> json) {
    return TopChefModel(
      id: json['id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['profilePhoto'],
    );
  }
}
