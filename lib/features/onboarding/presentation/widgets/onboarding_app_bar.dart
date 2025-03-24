import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';

import '../manager/onboarding_view_model.dart';


class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppBar(
      {super.key, required this.viewModel, required this.index});

  final OnboardingViewModel viewModel;

  final int index;

  @override
  Size get preferredSize => Size(double.infinity, 164);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        backgroundColor: AppColors.beigeColor,
        leading: Visibility(
          visible: index != 0,
          child: GestureDetector(
            onTap: () {
              viewModel.controller.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            child: SizedBox(
              width: 21,
              height: 14,
              child: SvgPicture.asset(
                "assets/svg/back.svg",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        leadingWidth: 30,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 104),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.onboardings[index].title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                viewModel.onboardings[index].subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
