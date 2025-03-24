import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';

import '../../../../core/presentation/widgets/recipe_small.dart';
import '../../../../core/utils/colors.dart';
import '../manager/me_profile_view_model.dart';
import '../widgets/me_profile_view_app_bar.dart';

class MeProfileView extends StatelessWidget {
  const MeProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<MeProfileViewModel>();
    if (viewModel.loading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.beigeColor,
          appBar: MeProfileViewAppBar(),
          body: TabBarView(
              children: [
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: viewModel.myRecipes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 170.w / 226.h,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return RecipeSmall(
                  recipeSmallModel: viewModel.myRecipes[index],
                );
              },
            ),
            SizedBox(
              width: 350,
              height: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.pink,
                        color: AppColors.redPinkMain,
                      ),
                    ),
                    Text(
                      "maknun is powerful",
                      style: TextStyle(
                          color: AppColors.redPinkMain,
                          fontFamily: "League Spartan",
                          fontSize: 94,
                          height: 0.9),
                    ),
                  ],
                ),
              ),
            )
          ]),
          bottomNavigationBar: RecipeBottomNavigationBar(),
        ),
      );
    }
  }
}
