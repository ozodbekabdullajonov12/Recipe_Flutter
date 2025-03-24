import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';

class PasswordTextForm extends StatelessWidget {
  const PasswordTextForm({
    super.key,
    required this.controller,
    required this.label,
    required this.errorText,
    required this.suffixOnTap, required this.isShowPassword,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String? errorText;
  final bool isShowPassword;
  final VoidCallback suffixOnTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            // height: 47,
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
                  hintText: "●●●●●●●",
                  suffix: GestureDetector(
                    onTap: suffixOnTap,
                    child: SvgPicture.asset(
                      "assets/svg/eye.svg",
                      width: 21,
                      height: 21,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  errorText: errorText,
                  errorStyle: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.error,
                  ),
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
              obscureText: isShowPassword,
              obscuringCharacter: "●",
              validator: validator,
            )),
      ],
    );
  }
}
