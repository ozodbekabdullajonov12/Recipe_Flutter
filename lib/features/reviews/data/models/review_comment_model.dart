import 'package:recipe_app/features/reviews/data/models/review_comment_user_model.dart';

class ReviewCommentModel {
  final int id;
  final num rating;
  final String comment, image, created;

  final ReviewCommentUserModel user;

  ReviewCommentModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.image,
    required this.created,
    required this.user,
  });

  factory ReviewCommentModel.fromJson(Map<String, dynamic> json) {
    return ReviewCommentModel(
      id: json["id"],
      rating: json["rating"],
      comment: json["comment"],
      image: json["image"],
      created: json["created"],
      user: ReviewCommentUserModel.fromJson(json["user"]
      ),
    );
  }
}
