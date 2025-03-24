import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../category_detail/data/repositories/recipe_repository.dart';
import '../../data/models/recipe_model.dart';


class RecipeViewModel extends ChangeNotifier {
  final RecipeRepository _repo;
  bool isLoading = true;

  final int recipeId;

  RecipeViewModel({
    required RecipeRepository repo,
    required this.recipeId,
  }) : _repo = repo {
    load();
  }

  late final RecipeModel recipe;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    recipe = await _repo.fetchRecipeById(recipeId);
    isLoading = false;
    notifyListeners();
  }
}
