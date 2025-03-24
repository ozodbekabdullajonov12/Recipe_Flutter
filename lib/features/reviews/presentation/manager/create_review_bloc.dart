import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/category_detail/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/reviews/data/repositories/review_repository.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_state.dart';

part 'create_review_events.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvents, CreateReviewState> {
  final ReviewRepository _reviewRepo;
  final RecipeRepository _recipeRepo;
  final reviewController = TextEditingController();
  CreateReviewBloc({
    required ReviewRepository reviewRepo,
    required RecipeRepository recipeRepo,
    required int recipeId,
  })  : _reviewRepo = reviewRepo,
        _recipeRepo = recipeRepo,
        super(CreateReviewState.initialize(recipeId)) {
    on<CreateReviewLoading>(onLoad);
    add(CreateReviewLoading(recipeId));
    on<SetRecommend>(setRecommend);
    on<SetRating>(setRating);
    on<ReviewSubmit>(reviewSubmit);
  }



  setRating(SetRating event, Emitter emit) {
    emit(state.copyWith(rating: event.rating));
  }

  setRecommend(SetRecommend event, Emitter emit) {
    emit(state.copyWith(isReco: event.isReco));
  }

  Future onLoad(CreateReviewLoading event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(status: CreateReviewStatus.loading, recipeId: event.recipeId));
    final recipe = await _recipeRepo.fetchRecipeForReviews(event.recipeId);
    emit(state.copyWith(recipeModel: recipe, status: CreateReviewStatus.idle));
  }

  Future reviewSubmit(ReviewSubmit event, Emitter emit) async {
    bool result = await _reviewRepo.createReview(
      recipeId: state.recipeId,
      rating: state.rating!,
      comment: reviewController.text,
      isReco: state.isReco!,
      image: state.pickedImage
    );
    if (result) {
      emit(state.copyWith(status: CreateReviewStatus.submitted));
    } else {
      emit(state.copyWith(status: CreateReviewStatus.error));
      emit(state.copyWith(status: CreateReviewStatus.idle));
    }
  }
}
