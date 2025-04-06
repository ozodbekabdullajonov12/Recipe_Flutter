import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeTextButtonContainer extends StatelessWidget {
  const RecipeTextButtonContainer({
    super.key,
    required this.text,
    required this.textColor,
    required this.containerColor,
    required this.callback,
    this.containerWidth = 300,
    this.containerHeight = 56,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
    this.containerPaddingH = 20,
  });

  final String text;
  final double fontSize;
  final double containerWidth, containerHeight;
  final double containerPaddingH;
  final FontWeight fontWeight;
  final Color textColor, containerColor;

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      style: TextButton.styleFrom(
        fixedSize: Size(containerWidth, containerHeight),
        backgroundColor: containerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        padding: EdgeInsets.symmetric(horizontal: containerPaddingH.w),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          height: 1,
        ),
      ),
    );
  }
}