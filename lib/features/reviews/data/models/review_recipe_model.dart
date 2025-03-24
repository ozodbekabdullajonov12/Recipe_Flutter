import '../../../recipe_detail/data/models/user_small_model.dart';

class ReviewsRecipeModel {
  final num rating, reviewsCount;
  final int id;
  final String title, image;

  final UserSmallModel user;

  ReviewsRecipeModel({
    required this.rating,
    required this.reviewsCount,
    required this.id,
    required this.title,
    required this.image,
    required this.user,
  });

  factory ReviewsRecipeModel.fromJson(Map<String, dynamic> json) {
    return ReviewsRecipeModel(
      rating: json["rating"],
      reviewsCount: json["reviewsCount"],
      id: json["id"],
      title: json["title"],
      image: json["photo"],
      user: UserSmallModel.fromJson(json["user"]),
    );
  }
}
