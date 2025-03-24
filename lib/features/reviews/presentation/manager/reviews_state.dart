import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/features/reviews/data/models/review_comment_model.dart';

import '../../data/models/review_recipe_model.dart';

enum ReviewsStatus { idle, loading, error }

@immutable
class ReviewsState extends Equatable {
  final ReviewsStatus status;
  final ReviewsRecipeModel? recipeModel;

  final List<ReviewCommentModel> comments;

  const ReviewsState({
    required this.recipeModel,
    required this.status,
    required this.comments
  });

  ReviewsState copyWith(
      {ReviewsRecipeModel? recipeModel, ReviewsStatus? status,List<ReviewCommentModel>? comments}) {
    return ReviewsState(
      recipeModel: recipeModel ?? this.recipeModel,
      status: status ?? this.status,
      comments: comments??[]
    );
  }

  factory ReviewsState.initialize() {
    return ReviewsState(recipeModel: null, status: ReviewsStatus.loading,comments: []);
  }

  @override
  List<Object?> get props => [recipeModel, status,comments];
}
