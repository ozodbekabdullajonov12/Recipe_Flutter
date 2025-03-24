import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/profile/presentation/widgets/user_profile_container.dart';
import '../manager/me_profile_view_model.dart';

class MeProfileViewAppBarBottom extends StatelessWidget {
  const MeProfileViewAppBarBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<MeProfileViewModel>();
    return Column(
      spacing: 7,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RecipeElevatedButton(
                text: "Edit Profile",
                callback: () {},
                size: Size(175.w, 27.h),
                fontSize: 15),
            RecipeElevatedButton(
              text: "Share Profile",
              callback: () {},
              size: Size(175, 27),
              fontSize: 15,
            ),
          ],
        ),
        UserProfileContainer(
          recipesCount: viewModel.me.recipesCount,
          followingCount: viewModel.me.followingCount,
          followerCount:viewModel.me. followerCount,
        ),
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
            Text(
              "Favorites",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
