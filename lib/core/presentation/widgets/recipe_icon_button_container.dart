import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/colors.dart';

class RecipeIconButtonContainer extends StatelessWidget {
  const RecipeIconButtonContainer({
    super.key,
    required this.image,
    required this.callback,
    this.containerWidth = 28,
    this.containerHeight = 28,
    required this.iconWidth,
    required this.iconHeight,
    this.iconColor = AppColors.pinkSub,
    this.containerColor = AppColors.pink,
  });

  final String image;
  final VoidCallback callback;
  final double containerWidth, containerHeight;
  final double iconWidth, iconHeight;

  final Color iconColor, containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(containerWidth / 2),
      ),
      child: IconButton(
        onPressed: callback,
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
          image,
          width: iconWidth,
          height: iconHeight,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
