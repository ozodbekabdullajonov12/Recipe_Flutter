import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/reviews/data/models/review_comment_model.dart';
import 'package:recipe_app/features/reviews/presentation/manager/reviews_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_comment_stars.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_comment_user.dart';

class ReviewsPageComment extends StatelessWidget {
  const ReviewsPageComment({
    super.key,
    required this.comment,
  });

  final ReviewCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewsCommentUser(
            user: comment.user,
            created: ReviewsBloc.sinceCreated(
              createdText: comment.created,
            )),
        Text(
          comment.comment,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
          softWrap: true,
          maxLines: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReviewsCommentStars(rating: comment.rating.toInt()),
            TextButton(
              onPressed: () {},
              child: Text(
                "See All",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.redPinkMain,
                  decorationThickness: 1.5,
                  decorationStyle: TextDecorationStyle.solid
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Divider(
          height: 1,
          color: AppColors.pinkSub,
        )
      ],
    );
  }
}
