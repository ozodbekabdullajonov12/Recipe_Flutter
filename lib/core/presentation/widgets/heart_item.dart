import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';

class HeartItem extends StatelessWidget {
  const HeartItem({super.key, required this.isLike});

  final bool isLike;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: (!isLike) ? AppColors.redPinkMain : Colors.pink,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: SvgPicture.asset(
          "assets/svg/heart.svg",
          fit: BoxFit.cover,
          width: 16,
          height: 16,
          colorFilter: ColorFilter.mode(
            (!isLike)?Colors.white:AppColors.pinkSub,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
