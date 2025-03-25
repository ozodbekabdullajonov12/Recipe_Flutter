import 'package:equatable/equatable.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';

enum YourRecipesStatus { idle, loading, error }

class YourRecipesState extends Equatable {
  final List<RecipeSmallModel>? recipes;

  final List<RecipeSmallModel>? mostViewedTodayRecipes;

  final YourRecipesStatus? status;

  const YourRecipesState({
    required this.recipes,
    required this.mostViewedTodayRecipes,
    required this.status,
  });

  @override
  List<Object?> get props => [recipes, status, mostViewedTodayRecipes];

  factory YourRecipesState.initial() {
    return YourRecipesState(
      recipes: [],
      mostViewedTodayRecipes: [],
      status: YourRecipesStatus.loading,
    );
  }

  YourRecipesState copyWith({
    List<RecipeSmallModel>? recipes,
    List<RecipeSmallModel>? mostViewedTodayRecipes,
    YourRecipesStatus? status,
  }) {
    return YourRecipesState(
      recipes: recipes ?? this.recipes,
      mostViewedTodayRecipes: mostViewedTodayRecipes ?? this.mostViewedTodayRecipes,
      status: status ?? this.status,
    );
  }
}
