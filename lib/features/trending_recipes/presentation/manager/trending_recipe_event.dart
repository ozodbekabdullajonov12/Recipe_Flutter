part of 'trending_recipe_bloc.dart';

sealed class TrendingRecipeEvent {}

class TrendingRecipeLoading extends TrendingRecipeEvent {
  TrendingRecipeLoading();
}