import 'dart:io';

import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/features/reviews/data/models/create_review_model.dart';

import '../models/review_comment_model.dart';

class ReviewRepository {
  ReviewRepository({required this.client});

  List<ReviewCommentModel> comments = [];
  final ApiClient client;

  Future<List<ReviewCommentModel>> fetchComments(int recipeId) async {
    var rawComments = await client.fetchRecipeComments(recipeId);
    comments = rawComments.map((e) => ReviewCommentModel.fromJson(e)).toList();
    return comments;
  }

  Future<bool> createReview(
      {required int recipeId,
      required int rating,
      required String comment,
      required bool isReco,
      File? image}) async {
    var review = CreateReviewModel(
      recipeId: recipeId,
      rating: rating,
      comment: comment,
      isReco: isReco,
      image: image,
    );
    var result = await client.createReview(review: review);
    return result;
  }
}
