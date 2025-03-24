import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class ChefFollowingButton extends StatelessWidget {
  const ChefFollowingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 81,
        height: 19,
        decoration: BoxDecoration(
            color: AppColors.pink, borderRadius: BorderRadius.circular(19)),
        child: Center(
          child: Text(
            "Following",
            style: TextStyle(
              color: AppColors.pinkSub,
              fontWeight: FontWeight.w500,
              fontSize: 9,
            ),
          ),
        ),
      ),
    );
  }
}
