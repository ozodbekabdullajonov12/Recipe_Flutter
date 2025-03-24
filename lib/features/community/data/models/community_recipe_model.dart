import 'package:recipe_app/features/recipe_detail/data/models/user_small_model.dart';

class CommunityRecipeModel {
  final num  time, rating, reviewsCount;
  final int id;
  final String title, dec, image, created;

  final UserSmallModel user;

  CommunityRecipeModel(
      {required this.id,
      required this.time,
      required this.rating,
      required this.reviewsCount,
      required this.title,
      required this.dec,
      required this.image,
      required this.created,
      required this.user});

  factory CommunityRecipeModel.fromJson(Map<String, dynamic> json) {
    return CommunityRecipeModel(
      id: json["id"],
      time: json["timeRequired"],
      rating: json["rating"],
      reviewsCount: json["reviewsCount"],
      title: json["title"],
      dec: json["description"],
      image: json["photo"],
      created: json["created"],
      user: UserSmallModel.fromJson(json["user"]),
    );
  }
}
