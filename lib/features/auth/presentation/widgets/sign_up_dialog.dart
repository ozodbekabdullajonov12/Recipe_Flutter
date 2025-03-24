import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

import '../../../../core/utils/colors.dart';





class SignUpDialog extends StatelessWidget {
  const SignUpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        backgroundColor: Colors.white,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)),
        child: Container(
          width: 250,
          height: 286,
          padding: EdgeInsets.symmetric(
              horizontal: 45, vertical: 20),
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 133,
                child: Text(
                  "Sign up Succesful!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: 83,
                height: 83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(42),
                  color: AppColors.pink,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/bottom/profile.svg",
                    width: 30,
                    height: 42,
                    colorFilter: ColorFilter.mode(
                      AppColors.redPinkMain,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet pretium cras"
                        " id dui pellentesque ornare."
                        " Quisque malesuada.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
