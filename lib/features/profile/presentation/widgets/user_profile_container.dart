import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/profile/presentation/widgets/user_review.dart';

import '../manager/me_profile_view_model.dart';

class UserProfileContainer extends StatelessWidget {
  const UserProfileContainer({
    super.key,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
  });

  final int recipesCount, followingCount, followerCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: AppColors.beigeColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.pink, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserReview(number: recipesCount, subtitle: "recipes"),
          Container(height: 26.h, width: 2, color: AppColors.pink),
          UserReview(number: followingCount, subtitle: "Following"),
          Container(height: 26.h, width: 2, color: AppColors.pink),
          UserReview(number: followerCount, subtitle: "Followers"),
        ],
      ),
    );
  }
}
