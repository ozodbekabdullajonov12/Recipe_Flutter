import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class RecipeElevatedButton extends StatelessWidget {
  const RecipeElevatedButton({
    super.key,
    required this.text,
    required this.callback,
    this.foregroundColor = AppColors.pinkSub,
    this.backgroundColor = AppColors.pink,
    required this.size,
    this.fontSize = 20,
    this.elevation = 0,
  });

  final String text;
  final VoidCallback callback;
  final Color foregroundColor, backgroundColor;
  final Size size;
  final double fontSize;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        fixedSize: size,
        elevation: elevation,
        backgroundColor: backgroundColor
      ),
      onPressed: callback,
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          fontSize: fontSize,
          height: 1,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"
        ),
      ),
    );
  }
}
