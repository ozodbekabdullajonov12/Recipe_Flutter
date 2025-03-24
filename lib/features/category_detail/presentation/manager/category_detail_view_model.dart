// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../categories/data/models/category_model.dart';
// import '../../../categories/data/repositories/categories_repository.dart';
// import '../../data/models/recipe_small_model.dart';
// import '../../data/repositories/recipe_repository.dart';
//
// class CategoryDetailState {
//   final List<RecipeSmallModel> recipes;
//
//   final List<CategoryModel> categories;
//   final CategoryModel? selected;
//
//   final int categoryId;
//   final CategoryDetailStatus status;
//
//   CategoryDetailState({
//     required this.recipes,
//     required this.categories,
//     this.selected,
//     required this.categoryId,
//     required this.status,
//   });
// }
//
// class CategoryDetailBloc extends Bloc<CategoryDetailEvent, CategoryDetailState> {
//   final RecipeRepository _repo;
//   final CategoriesRepository _cateRepo;
//
//   CategoryDetailBloc({
//     required RecipeRepository repo,
//     required CategoriesRepository cateRepo,
//     required int categoryId,
//   })
//       : _repo = repo,
//         _cateRepo = cateRepo,
//         super(CategoryDetailState(
//         recipes: [],
//         categories: [],
//         categoryId: categoryId,
//         status: CategoryDetailStatus.loading,
//       )) {
//     on<CategoryDetailLoading>(event, emit) {
//       emit(CategoryDetailState(recipes: recipes,
//         categories: categories,
//         categoryId: categoryId,
//         status: status,),);
//       recipes = await _repo.fetchRecipesByCategoryId(categoryId: categoryId);
//       categories = await _cateRepo.fetchCategories();
//       if (categories.isNotEmpty) {
//         selected = categories.firstWhere(
//               (category) => category.id == categoryId,
//           orElse: () => categories.first,
//         );
//       }
//
//       notifyListeners();
//     }
//   }
// }
//
// enum CategoryDetailStatus { idle, loading, error }
//
// class CategoryDetailEvent {}
//
// class CategoryDetailLoading extends CategoryDetailEvent {}
//
//
//
//
//
//
//



import 'package:flutter/material.dart';

import '../../../categories/data/models/category_model.dart';
import '../../../categories/data/repositories/categories_repository.dart';
import '../../data/models/recipe_small_model.dart';
import '../../data/repositories/recipe_repository.dart';


class CategoryDetailViewModel extends ChangeNotifier {
  final RecipeRepository _repo;
  final CategoriesRepository _cateRepo;
  final int categoryId;

  List<RecipeSmallModel> recipes = [];
  List<CategoryModel> categories = [];
  CategoryModel? selected;

  CategoryDetailViewModel(
      {required RecipeRepository repo,
        required this.categoryId,
        required CategoriesRepository cateRepo})
      : _repo = repo,
        _cateRepo = cateRepo {
    load();
  }

  Future load() async {
    recipes = await _repo.fetchRecipesByCategoryId(categoryId: categoryId);
    categories = await _cateRepo.fetchCategories();
    if (categories.isNotEmpty) {
      selected = categories.firstWhere(
            (category) => category.id == categoryId,
        orElse: () => categories.first,
      );
    }

    notifyListeners();
  }
}
