import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_state.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_recommend.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_buttons.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_comment.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_main_image.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_view_set_rating.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_app_bar.dart';

import '../../../../core/utils/colors.dart';

class CreateReviewView extends StatelessWidget {
  const CreateReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateReviewBloc, CreateReviewState>(
      listener: (context, state) async {
        if (state.status == CreateReviewStatus.submitted) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(
                child: Dialog(
                  backgroundColor: Colors.white,
                  child: Container(
                    width: 276.w,
                    height: 370.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 36.w, vertical: 36.h),
                    child: Column(
                      spacing: 20.h,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            "Thank you for your Review!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.beigeColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SvgPicture.asset("assets/svg/check.svg"),
                        Text(
                          "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.beigeColor,
                            fontSize: 13,
                          ),
                        ),
                        RecipeElevatedButton(
                          text: "Go Back",
                          backgroundColor: AppColors.redPinkMain,
                          foregroundColor: Colors.white,
                          size: Size(190.w, 45.h),
                          fontSize: 20,
                          callback: () => context.pop(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
          if (context.mounted) {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(Routes.homePage);
            }
          }
        }

        if (state.status == CreateReviewStatus.error && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Nimadur Xato ketdi!",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: ReviewsAppBar(
            backTap: () {
              context.pop();
            },
            title: "Leave a Review",
          ),
          bottomNavigationBar: RecipeBottomNavigationBar(),
          body: (state.status == CreateReviewStatus.loading)
              ? Center(child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(),
          ))
              : RefreshIndicator(
            onRefresh: () async => context
                .read<CreateReviewBloc>()
                .add(CreateReviewLoading(state.recipeId)),
            child: ListView(
              padding:
              EdgeInsets.symmetric(horizontal: 37.w, vertical: 7.h),
              children: [
                CreateReviewMainImage(
                  recipeModel: state.recipeModel!,
                ),
                SizedBox(height: 20),
                CreateReviewViewSetRating(),
                SizedBox(height: 50),
                CreateReviewComment(
                  controller:
                  context.read<CreateReviewBloc>().reviewController,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      color: Colors.pink,
                      iconSize: 28,
                      style: ButtonStyle(),
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: AppColors.redPinkMain,
                        size: 21,
                      ),
                    ),
                    Text(
                      "Add Photo",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                CreateReviewRecommend(),
                SizedBox(height: 100),
                CreateReviewButtons()
              ],
            ),
          )
        );
      },
    );
  }
}
