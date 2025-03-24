import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/auth/presentation/manager/sign_up_view_model.dart';


class SignDateOfBirth extends StatelessWidget {
  const SignDateOfBirth({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? date = context.select((SignUpViewModel vm) => vm.selectedDate);
    var vm=context.watch<SignUpViewModel>();
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            "Date of birth",
            style: TextStyle(
              color: Color(0xffFFFDF9),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () async {
              DateTime? selectDate = await showDatePicker(
                context: context,
                firstDate: DateTime.utc(1900, 1, 1),
                initialDate: DateTime.now(),
                // helpText: "Select your birth date,bratish",
                lastDate: DateTime.now(),
                builder: (context, child) => Theme(
                  data: ThemeData(
                    colorScheme: ColorScheme(
                      brightness: Brightness.dark,
                      surface: Colors.white,
                      onSurface: AppColors.beigeColor,
                      primary: AppColors.redPinkMain,
                      onPrimary: Colors.white,
                      secondary: AppColors.pink,
                      onSecondary: AppColors.pinkSub,
                      error: AppColors.redPinkMain,
                      onError: Colors.white,
                    ),
                  ),
                  child: child!,
                ),
              );
              vm.selectedDate=selectDate;
            },
            child: Container(
              width: double.infinity,
              height: 47,
              padding: EdgeInsets.symmetric(horizontal: 36),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(18)),
              child: Text(
               (date==null)?"DD/MM/YYYY":DateFormat("dd/MM/yyyy").format(date!),
                style: TextStyle(
                  color: AppColors.beigeColor.withValues(alpha: (date==null)?0.6:1),
                  fontSize: 16,
                  height: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
