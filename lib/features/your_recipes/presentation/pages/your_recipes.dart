import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/app_bar_action.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_flutter_app_bar.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/your_recipes/presentation/manager/your_recipes_bloc.dart';
import 'package:recipe_app/features/your_recipes/presentation/manager/your_recipes_state.dart';

import '../../../../core/presentation/widgets/recipe_small.dart';
import '../../../../core/utils/colors.dart';
import '../../../home_page/presentation/widgets/home_my_recipes.dart';

class YourRecipes extends StatelessWidget {
  const YourRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBarFlutter(title: "Your Recipes", actions: [
        AppBarAction(
          child: "assets/svg/notification.svg",
          onTap: () {},
        ),
        AppBarAction(
          child: "assets/svg/search.svg",
          onTap: () {},
        ),
      ]),
      extendBody: true,
      bottomNavigationBar: RecipeBottomNavigationBar(),
      body: RefreshIndicator(
        onRefresh: () async =>
            context.read<YourRecipesBloc>().add(YourRecipesLoading()),
        child: ListView(
          children: [
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
                    "Most Viewed Today",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  BlocBuilder<YourRecipesBloc, YourRecipesState>(
                    builder: (context, state) {
                      if (state.status == YourRecipesStatus.idle) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => context.push(
                                Routes.recipeBuilder(
                                    state.mostViewedTodayRecipes![0].id),
                              ),
                              child: HomeMyRecipes(
                                  recipeSmallModel:
                                      state.mostViewedTodayRecipes![0]),
                            ),
                            GestureDetector(
                              onTap: () => context.push(
                                Routes.recipeBuilder(
                                    state.mostViewedTodayRecipes![1].id),
                              ),
                              child: HomeMyRecipes(
                                  recipeSmallModel:
                                  state.mostViewedTodayRecipes![1]),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator()),
                        );
                      }
                    },
                  ),

                ],
              ),
            ),
            BlocBuilder<YourRecipesBloc, YourRecipesState>(
              builder: (context, state) {
                if (state.status == YourRecipesStatus.idle) {
                  return  SizedBox(
                    height:900,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: state.recipes!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 170.w / 226.h,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return RecipeSmall(
                          recipeSmallModel: state.recipes![index],
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
