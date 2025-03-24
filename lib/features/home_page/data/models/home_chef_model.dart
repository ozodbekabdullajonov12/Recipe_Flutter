class HomeChefModel {
  final int id;
  final String name, image;

  HomeChefModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory HomeChefModel.fromJson(Map<String, dynamic> json) {
    return HomeChefModel(
      id: json["id"],
      name: json["firstName"],
      image: json["photo"],
    );
  }
}
