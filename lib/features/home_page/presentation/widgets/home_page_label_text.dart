import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class HomePageLabelText extends StatelessWidget {
  const HomePageLabelText({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: AppColors.redPinkMain,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    );
  }
}
