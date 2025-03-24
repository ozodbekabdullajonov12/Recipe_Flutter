import 'package:flutter/material.dart';

import '../../../auth/data/repositories/user_repository.dart';
import '../../../category_detail/data/models/recipe_small_model.dart';
import '../../../category_detail/data/repositories/recipe_repository.dart';
import '../../data/models/user_model.dart';


class ChefProfileViewModel extends ChangeNotifier {
  final UserRepository _userRepo;
  final RecipeRepository _recipeRepo;
  final int userId;
  late UserModel chef;
  late List<RecipeSmallModel> recipes;
  bool loading = true;

  ChefProfileViewModel(
      {required UserRepository userRepo,
        required this.userId,
        required RecipeRepository recipeRepo})
      : _userRepo = userRepo,
        _recipeRepo = recipeRepo {
    load();
  }

  Future<void> load() async {
    loading = true;
    notifyListeners();
    chef = await _userRepo.fetchChefProfileById(userId);
    recipes = await _recipeRepo.fetchRecipesByUserId(userId: userId);
    loading = false;
    notifyListeners();
  }
}
