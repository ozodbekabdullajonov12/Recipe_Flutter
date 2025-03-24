import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';

class AuthFormText extends StatelessWidget {
  const AuthFormText({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.label,
    required this.errorText,
  });

  final TextEditingController controller;
  final String hintText, label;
  final String? errorText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xffFFFDF9),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10
          ),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              controller: controller,
              textAlignVertical: TextAlignVertical.top,
              cursorHeight: 20,
              style: TextStyle(
                  color: AppColors.beigeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1),
                decoration: InputDecoration(
                  hintText: hintText,
                  errorStyle: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  errorText: errorText,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 36),
                  hintStyle: TextStyle(
                    color: AppColors.beigeColor.withValues(alpha: 0.6),
                    fontSize: 16,
                    height: 1,
                  ),
                  filled: true,
                  fillColor: AppColors.pink),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
