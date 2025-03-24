part of "create_review_bloc.dart";

sealed class CreateReviewEvents {}

final class CreateReviewLoading extends CreateReviewEvents{
  final int recipeId;
  CreateReviewLoading(this.recipeId);
}


final class SetRating extends CreateReviewEvents {
  final int rating;

  SetRating(this.rating);
}

final class SetRecommend extends CreateReviewEvents {
  final bool isReco;
  SetRecommend(this.isReco);
}

final class ReviewSubmit extends CreateReviewEvents{}


