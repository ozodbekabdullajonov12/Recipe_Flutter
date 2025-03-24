import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_state.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_main_image.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_app_bar.dart';

import '../../../../core/utils/colors.dart';

class CreateReviewViewSetRating extends StatelessWidget {
  const CreateReviewViewSetRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewBloc, CreateReviewState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 4,
        children: [
          Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) {
                return GestureDetector(
                  onTap:() =>context
                      .read<CreateReviewBloc>()
                      .add(SetRating(index + 1)),
                  child: SvgPicture.asset(
                    width: 29,
                    height: 29,
                    "assets/svg/star${(state.rating! > index) ? "" : "_free"}.svg",
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      AppColors.redPinkMain,
                      BlendMode.srcIn,
                    ),
                  ),
                );
              },
            ),
          ),
          Text(
            "Your overall rating",
            maxLines: 1,
            softWrap: true,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
