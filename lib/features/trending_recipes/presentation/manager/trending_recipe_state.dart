import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../data/models/trending_recipe_model.dart';

enum TrendingRecipeStatus { idle, loading, error }

@immutable
class TrendingRecipeState extends Equatable {
  final TrendingRecipeStatus status;
  final TrendingRecipeModel? recipesForMostViewed;
  final List<TrendingRecipeModel> recipes;

  const TrendingRecipeState({
    required this.status,
    required this.recipes,
    required this.recipesForMostViewed,
  });

  TrendingRecipeState copyWith({
    TrendingRecipeStatus? status,
    TrendingRecipeModel? recipesForMostViewed,
    List<TrendingRecipeModel>? recipes,
  }) {
    return TrendingRecipeState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
      recipesForMostViewed: recipesForMostViewed ?? this.recipesForMostViewed,
    );
  }

  @override
  List<Object?> get props => [recipes, status, recipesForMostViewed];

  factory TrendingRecipeState.initial() {
    return const TrendingRecipeState(
      status: TrendingRecipeStatus.loading,
      recipes: [],
      recipesForMostViewed: null,
    );
  }
}
