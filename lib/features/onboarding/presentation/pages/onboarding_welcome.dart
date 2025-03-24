import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/onboarding/presentation/manager/onboarding_view_model.dart';
import 'package:recipe_app/features/onboarding/presentation/widgets/welcome_item.dart';




class OnboardingWelcome extends StatelessWidget {
  const OnboardingWelcome({super.key, required this.viewModel});

  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppBar(
              backgroundColor: AppColors.beigeColor,
              leading: GestureDetector(
                onTap: () {
                 context.go("${Routes.onboarding}?back=true");
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
              leadingWidth: 30,
            ),
          ),
        ),
        backgroundColor: AppColors.beigeColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 18),
              itemCount: viewModel.categories.length,
              itemBuilder: (context, index) => (index < 6)
                  ? WelcomeItem(
                      image: viewModel.categories[index].image,
                    )
                  : null,
            ),
            Text(
              "Welcome",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 13,
                height: 1,
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            RecipeElevatedButton(
              text: "I'm New",
              callback: () {},
              size: Size(207, 45),
              fontSize: 20,
            ),
            RecipeElevatedButton(
                text: "I’ve been here",
                callback: () {
                  // context.go("/user/3");
                },
                size: Size(207, 45)),
            SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}
