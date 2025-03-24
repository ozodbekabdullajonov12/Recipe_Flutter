import 'package:flutter/material.dart';

import '../../../auth/data/repositories/user_repository.dart';
import '../../../category_detail/data/models/recipe_small_model.dart';
import '../../../category_detail/data/repositories/recipe_repository.dart';
import '../../data/models/user_model.dart';


class MeProfileViewModel extends ChangeNotifier {
  final UserRepository _userRepo;
  final RecipeRepository _recipeRepo;
  late UserModel me;
   List<RecipeSmallModel> myRecipes=[];
  bool loading = true;

  MeProfileViewModel(
      {required UserRepository userRepo,
      required RecipeRepository recipeRepo})
      : _userRepo = userRepo,
        _recipeRepo = recipeRepo {
    load();
  }

  Future<void> load() async {
    loading = true;
    notifyListeners();

    me = await _userRepo.fetchMyProfile();
    myRecipes = await _recipeRepo.fetchMyRecipes();
    notifyListeners();
    loading = false;

  }
}
