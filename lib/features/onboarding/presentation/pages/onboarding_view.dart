import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/onboarding/presentation/manager/onboarding_view_model.dart';
import 'package:recipe_app/features/onboarding/presentation/widgets/onboarding_app_bar.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
    required this.viewModel,
  });

  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            itemCount: viewModel.onboardings.length+1,
            controller: viewModel.controller,
            itemBuilder: (context, index) => Stack(
              children: [
                Scaffold(
                  appBar: OnboardingAppBar(viewModel: viewModel,index: index,),
                  backgroundColor: AppColors.beigeColor,
                  body: Stack(
                    children: [
                      Image.network(
                        viewModel.onboardings[index].image,
                        fit: BoxFit.cover,
                        height: 741,
                        width: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 286,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.beigeColor,
                                Colors.transparent
                              ],
                              stops: [0.2, 1],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onPageChanged:(index)=>viewModel.pageChangedCallBack(index, context),
          ),
          Container(
            width: double.infinity,
            height: 128,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.beigeColor, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 75,
            left: 111,
            right: 111,
            child: RecipeElevatedButton(
              text: "continue",
              fontSize: 20,
              elevation: 1,
              callback: () {
                viewModel.controller.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
              size: Size(207, 45),
            ),
          ),
        ],
      ),
    );
  }
}
