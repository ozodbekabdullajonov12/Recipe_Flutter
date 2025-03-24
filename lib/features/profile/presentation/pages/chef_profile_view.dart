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
                  SizedBox(
                    height: 800.h,
                    child: ListView.separated(
                      clipBehavior: Clip.none,
                      itemCount: 4,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 40,
                      ),
                      itemBuilder: (context, index) => UserRecipesCategory(
                        id: 1,
                        image: "https://s3-alpha-sig.figma.com/img/4da3/a1f9/1"
                            "7ea214cd60e5b3e274372cafcb56b55?Expires=1743379200&Ke"
                            "y-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ZXo68PiGzzNBW6"
                            "O6fE8ts6ep~rGSGcC6~7w~Gxv8lj7pJvLn70DWd-CuBb8L59qDoUXaVnri"
                            "sM1chz5qg2kbMgMBHU1S3fdr0-E~SF5B45-Jgk1wyVmR8tfMBLs7hWYX5HtBOc"
                            "aa88xD9usGKNn9v1GfS8q4Tg6z5PvwXEiwdHw4tVTTwaUlLkUWJM7C~yJCBF"
                            "QwvBtOnBg6rz85GEhH5dQlnysLumDgKYZyIb7rQ5mdw37lVGNPUE4OLgaZd2"
                            "96gaBVN2ofK~mO7oc0LPAnoTsEzDBPU8b5atGNB8hiqa74qfg0NjEFcoIgv4H"
                            "li8yn9E3ELcviIsOQYnQE8RMBtg__",
                        title: "maknun bilan yasha",
                      ),
                    ),),
                ],
              ),
            )
          : CircularProgressIndicator(),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}




