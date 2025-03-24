import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/onboarding/data/models/onboarding_model.dart';

import '../../../categories/data/models/category_model.dart';
import '../../../categories/data/repositories/categories_repository.dart';
import '../../data/repositories/onboarding_repository.dart';


class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel(
      {required OnboardingRepository repo,
      required CategoriesRepository cateRepo,
      this.back = false})
      : _repo = repo,
        _cateRepo = cateRepo {
    load();
  }

  bool back;
  final PageController controller = PageController();

  final OnboardingRepository _repo;

  final CategoriesRepository _cateRepo;
  List<OnboardingModel> onboardings = [];
  List<CategoryModel> categories = [];

  Future<void> load() async {
    onboardings = await _repo.fetchOnboardingPages();
    categories = await _cateRepo.fetchCategories();
    if (back) {
      controller.jumpToPage(onboardings.length - 1);
    }
    notifyListeners();
  }



  void pageChangedCallBack(int index, BuildContext context) {
    if (index == onboardings.length) {
      context.go(Routes.welcome);
    }
  }
}
