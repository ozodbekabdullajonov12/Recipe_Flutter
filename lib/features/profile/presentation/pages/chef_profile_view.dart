import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/profile/presentation/manager/chef_profile_view_model.dart';
import 'package:recipe_app/features/profile/presentation/widgets/user_profile_container.dart';
import 'package:recipe_app/features/profile/presentation/widgets/user_profile_photo.dart';
import 'package:recipe_app/features/profile/presentation/widgets/user_recipes_category.dart';

import '../../../../core/presentation/widgets/recipe_small.dart';
import '../../../../core/utils/colors.dart';

import '../widgets/chef_following_button.dart';
import '../widgets/chef_profile_app_bar.dart';

class ChefProfileView extends StatelessWidget {
  const ChefProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<ChefProfileViewModel>();
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: ChefProfileAppBar(
        backTap: () {
          context.go(Routes.homePage);
        },
        action1Tap: () {},
        action2Tap: () {},
        action1: "assets/svg/share.svg",
        action2: "assets/svg/three-dots.svg",
        title: "@${!vm.loading ? vm.chef.username : "Chef_username"}",
      ),
      body: (!vm.loading)
          ? DefaultTabController(
              length: 1,
              child: ListView(
                clipBehavior: Clip.none,
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10,
                    children: [
                      UserProfilePhoto(photo: vm.chef.profilePhoto),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 8,
                        children: [
                          Text(
                            softWrap: true,
                            maxLines: 1,
                            "${vm.chef.name} ${vm.chef.surname}",
                            style: TextStyle(
                              color: AppColors.redPinkMain,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            softWrap: true,
                            maxLines: 3,
                            vm.chef.presentation,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "League Spartans",
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                height: 1),
                          ),
                          ChefFollowingButton()
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  UserProfileContainer(
                    recipesCount: vm.chef.recipesCount,
                    followingCount: vm.chef.followingCount,
                    followerCount: vm.chef.followerCount,
                  ),
                  SizedBox(height: 8),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: AppColors.redPinkMain,
                    tabs: [
                      Text(
                        "Recipes",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                   TabBarView(
                        children: [
                          GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            itemCount: vm.recipes.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 170.w / 226.h,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return RecipeSmall(
                                recipeSmallModel: vm.recipes[index],
                              );
                            },
                          ),
                        ]),
                ],
              ),
            )
          : CircularProgressIndicator(),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}




