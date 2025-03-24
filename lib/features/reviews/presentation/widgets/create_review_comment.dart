import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors.dart';
import '../manager/create_review_bloc.dart';
import '../manager/create_review_state.dart';

class CreateReviewComment extends StatelessWidget {
  const CreateReviewComment({
    super.key, required this.controller,
    this.errorText

  });

  final TextEditingController controller;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewBloc, CreateReviewState>(
      builder: (context, state) => TextField(
        minLines: 3,
        maxLines: 10,
        controller: controller,
        style: TextStyle(
          color: AppColors.beigeColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          filled: true,
          errorText: errorText,
          fillColor: Color(0xffFFC6C9),
          hintText: "Leave us Review!",
          hintStyle: TextStyle(
            color: AppColors.beigeColor.withValues(alpha: 0.6),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
