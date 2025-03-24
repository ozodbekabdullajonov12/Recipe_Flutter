import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/utils/colors.dart';

class ReviewsCommentStars extends StatelessWidget {
  const  ReviewsCommentStars({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: List.generate(
        5,
        (index) {
          if (rating > index) {
            return SvgPicture.asset(
              width: 16,
              height: 16,
              "assets/svg/star.svg",
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                AppColors.redPinkMain,
                BlendMode.srcIn,
              ),
            );
          }
          else {
            return SvgPicture.asset(
            width: 16,
            height: 16,
            "assets/svg/star_free.svg",
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              AppColors.redPinkMain,
              BlendMode.srcIn,
            ),
          );
          }
        }
        ,
      ),
    );
  }
}
