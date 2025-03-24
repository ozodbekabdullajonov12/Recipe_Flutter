import 'package:flutter/material.dart';
import 'package:recipe_app/features/auth/data/repositories/user_repository.dart';
import 'package:recipe_app/features/categories/data/models/category_model.dart';
import 'package:recipe_app/features/categories/data/repositories/categories_repository.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';
import 'package:recipe_app/features/category_detail/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/home_page/data/models/home_chef_model.dart';

import '../../../profile/data/models/user_model.dart';

class HomePageViewModel extends ChangeNotifier {
  final RecipeRepository _recipeRepo;
  final CategoriesRepository _categoryRepo;

  final UserRepository _userRepo;

  List<RecipeSmallModel> myRecipes = [];
  List<RecipeSmallModel> addedRecipes = [];

  List<HomeChefModel> chefs=[];

 late RecipeSmallModel trendingRecipe;
 late UserModel me;
  List<CategoryModel> categories = [];

  bool loading = true;

  HomePageViewModel(
      {required RecipeRepository recipeRepo,
      required CategoriesRepository categoryRepo,
      required UserRepository userRepo})
      : _recipeRepo = recipeRepo,
        _categoryRepo = categoryRepo,
  _userRepo=userRepo
  {
    load();
  }

  Future load() async {
    loading = true;
    notifyListeners();
    trendingRecipe = await _recipeRepo.fetchTrendingRecipe();
    myRecipes = await _recipeRepo.fetchMyRecipes(2);
    categories = await _categoryRepo.fetchCategories();
    addedRecipes=await _recipeRepo.fetchRecipesOrderByDate(2);
    chefs=await _userRepo.fetchHomeChefs(4);
    me=await _userRepo.fetchMyProfile();
    loading = false;
    notifyListeners();
  }
}
