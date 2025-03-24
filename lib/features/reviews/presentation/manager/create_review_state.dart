import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe_app/features/reviews/data/models/recipe_create_review_model.dart';

enum CreateReviewStatus { loading, idle, error,submitted}

@immutable
class CreateReviewState extends Equatable {
  @override
  List<Object?> get props => [recipeId, status, rating, comment, isReco];

  final int recipeId;
  final int? rating;
  final String? comment;
  final bool? isReco;
  final CreateReviewStatus status;
  final File? pickedImage;
  final RecipeCreateReviewModel? recipeModel;

  const CreateReviewState(
      {required this.recipeId,
      required this.rating,
      required this.comment,
      required this.isReco,
      required this.status,
      required this.pickedImage,
      required this.recipeModel});

  static CreateReviewState initialize(int id) {
    return CreateReviewState(
      recipeId: id,
      rating: 0,
      comment: null,
      isReco: null,
      status: CreateReviewStatus.loading,
      recipeModel: null,
      pickedImage: null,
    );
  }

  CreateReviewState copyWith(
      {int? recipeId,
      int? rating,
      String? comment,
      bool? isReco,
      CreateReviewStatus? status,
      RecipeCreateReviewModel? recipeModel,
      File? pickedImage}) {
    return CreateReviewState(
      recipeId: recipeId ?? this.recipeId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      isReco: isReco ?? this.isReco,
      status: status ?? this.status,
      recipeModel: recipeModel ?? this.recipeModel,
      pickedImage: pickedImage ?? this.pickedImage,
    );
  }
}
