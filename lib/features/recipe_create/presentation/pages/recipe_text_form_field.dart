import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class RecipeTextFormField extends StatelessWidget {
  const RecipeTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final String label, hintText;
  final TextEditingController controller;
  final int minLines, maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        TextFormField(
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.beigeColor.withValues(alpha: 0.45),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            filled: true,
            fillColor: AppColors.pink,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
      ],
    );
  }
}