import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_app_bar.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_view_steps.dart';
import 'package:recipe_app/features/recipe_detail/presentation/manager/recipe_view_model.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_image.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_view_detail_item.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_view_ingredients.dart';

import '../widgets/recipe_view_chef_profile.dart';

class RecipeView extends StatelessWidget {
  const RecipeView({super.key, this.appBarTitle});

  final String? appBarTitle;

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<RecipeViewModel>();

    return Scaffold(
      appBar: RecipeAppBar(
        backTap: () {
          context.pop();
        },
        action1Tap: () {},
        action2Tap: () {},
        action1: "assets/svg/heart.svg",
        action2: "assets/svg/share.svg",
        title: (!vm.isLoading) ? vm.recipe.title : "Recipe",
      ),
      extendBody: true,
      bottomNavigationBar: RecipeBottomNavigationBar(),
      body: (!vm.isLoading)
          ? ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          RecipeImage(),
          SizedBox(
              height: 20.h
          ),
          RecipeViewChefProfile(),
          SizedBox(
              height: 20.h
          ),
          RecipeViewDetailItem(
            time: vm.recipe.time,
            dec: vm.recipe.dec,
          ),
          SizedBox(
              height: 20.h
          ),
          RecipeViewIngredients(ingredients: vm.recipe.ingredients),
          SizedBox(
              height: 20.h),
          RecipeViewSteps(rawInstruction: vm.recipe.instructions),

        ],
      )
          : Center(
        child: SizedBox(
          height: 100.w,
          width: 100.h,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
