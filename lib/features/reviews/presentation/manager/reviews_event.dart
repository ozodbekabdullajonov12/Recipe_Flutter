part of 'reviews_bloc.dart';

sealed class ReviewsEvent {}

final class ReviewsLoading extends ReviewsEvent{
  final int recipeId;

  ReviewsLoading({required this.recipeId});
}
final class ReviewsShowAllComment extends ReviewsEvent{}