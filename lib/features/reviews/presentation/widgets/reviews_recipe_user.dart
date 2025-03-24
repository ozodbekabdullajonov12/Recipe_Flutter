import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';
import 'package:recipe_app/features/community/data/models/community_recipe_model.dart';
import 'package:recipe_app/features/recipe_detail/data/models/user_small_model.dart';

import '../../../../core/utils/colors.dart';

class ReviewsRecipeUser extends StatelessWidget {
  const ReviewsRecipeUser({
    super.key,
    required this.user,
  });

  final UserSmallModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(
        Routes.chefProfileBuilder(user.id),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: user.profilePhoto,
              fit: BoxFit.cover,
              height: 32.h,
              width: 32.w,
              progressIndicatorBuilder: (context, url, progress) {
                return Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    strokeWidth: 2,
                  ),
                );
              },
              errorWidget: (context, url, error) =>
                  Icon(Icons.person, size: 32, color: Colors.grey),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          SizedBox(
            width: 127.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@${user.username}",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                  maxLines: 1,
                ),
                Text(
                  "${user.name} ${user.surname}",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "League Spartan",
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.w300,
                  ),
                  softWrap: true,
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
