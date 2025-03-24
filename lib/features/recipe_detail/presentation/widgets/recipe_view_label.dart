import "package:flutter/material.dart";
import "package:recipe_app/core/utils/colors.dart";

class RecipeViewLabel extends StatelessWidget {
  const RecipeViewLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: AppColors.redPinkMain,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
