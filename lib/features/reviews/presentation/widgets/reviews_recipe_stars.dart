import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReviewsRecipeStars extends StatelessWidget {
  const ReviewsRecipeStars({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4.w,
      children: List.generate(
        5,
        (index) {
          if (rating > index) {
            return SvgPicture.asset(
              width: 11.w,
              height: 11.w,
              "assets/svg/star.svg",
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            );
          }
          else {
            return SvgPicture.asset(
            width: 11.w,
            height: 11.h,
            "assets/svg/star_free.svg",
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white,
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
