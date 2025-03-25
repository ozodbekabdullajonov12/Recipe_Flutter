import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_small.dart';
import 'package:recipe_app/core/utils/colors.dart';

import 'package:recipe_app/features/home_page/presentation/manager/home_page_view_model.dart';
import 'package:recipe_app/features/home_page/presentation/widgets/home_chef.dart';
import 'package:recipe_app/features/home_page/presentation/widgets/home_page_app_bar.dart';
import 'package:recipe_app/features/home_page/presentation/widgets/home_page_label_text.dart';
import 'package:recipe_app/features/home_page/presentation/widgets/trending_recipe.dart';

import '../../../../core/routing/routes.dart';
import '../widgets/home_my_recipes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<HomePageViewModel>();
    return Scaffold(
      extendBody: true,
      appBar: (!vm.loading) ? HomePageAppBar() : AppBar(title: Placeholder()),
      body: (!vm.loading)
          ? ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomePageLabelText(label: "Trending Recipe"),
                      SizedBox(
                        height: 6,
                      ),
                      TrendingRecipe(trendingRecipe: vm.trendingRecipe)
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 14),
                  width: double.infinity,
                  height: 255.h,
                  decoration: BoxDecoration(
                      color: AppColors.redPinkMain,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Your Recipes",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.push(Routes.yourRecipes),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HomeMyRecipes(recipeSmallModel: vm.myRecipes[0]),
                            HomeMyRecipes(recipeSmallModel: vm.myRecipes[1])
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomePageLabelText(label: "Top Chefs"),
                      SizedBox(
                        height: 7,
                      ),
                      GestureDetector(
                        onTap: () => context.push(Routes.topChef),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HomeChef(chef: vm.chefs[0]),
                            HomeChef(chef: vm.chefs[1]),
                            HomeChef(chef: vm.chefs[2]),
                            HomeChef(chef: vm.chefs[3])
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomePageLabelText(label: "Recently Added"),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RecipeSmall(recipeSmallModel: vm.addedRecipes[0]),
                          RecipeSmall(recipeSmallModel: vm.addedRecipes[1])
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
