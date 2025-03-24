import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/l10n/app_localization.dart';

import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/auth/presentation/manager/auth_view_model.dart';
import 'package:recipe_app/features/auth/presentation/widgets/auth_form_text.dart';
import 'package:recipe_app/features/auth/presentation/widgets/auth_social.dart';
import 'package:recipe_app/features/auth/presentation/widgets/password_text_form.dart';



class AuthView extends StatelessWidget {
  const AuthView({super.key, required this.vm});

  final AuthViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: Text(
            AppLocalizations.of(context)!.login,
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 152, bottom: 100),
          children: [
            Form(
              key: vm.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AuthFormText(
                      errorText: (vm.hasError) ? vm.errorMessage : null,
                      label: AppLocalizations.of(context)!.login,
                      controller: vm.loginController,
                      hintText: AppLocalizations.of(context)!.loginHintText,
                      validator: (jnj) {
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    PasswordTextForm(
                      isShowPassword: vm.showObscureText,
                      suffixOnTap: () {
                        vm.showPassword();
                      },
                      controller: vm.passwordController,
                      errorText: (vm.hasError)? vm.errorMessage!:null,
                      label: AppLocalizations.of(context)!.password,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: RecipeElevatedButton(
                text:AppLocalizations.of(context)!.login,
                callback: () async {
                  if (vm.formKey.currentState!.validate()) {
                    if (await vm.login() && context.mounted) {
                      context.go(Routes.homePage);
                    }
                  }
                },
                size: Size(207, 45),
              ),
            ),
            SizedBox(height: 27),
            Center(
              child: RecipeElevatedButton(
                text: AppLocalizations.of(context)!.signUp,
                callback: () {
                  context.go(Routes.signUp);
                },
                size: Size(207, 45),
              ),
            ),
            SizedBox(height: 65),
            Center(
              child: Text(
                AppLocalizations.of(context)!.forgotPassword,
                style: TextStyle(
                  color: Color(0xffFFFDF9),
                  fontSize: 15,
                  fontFamily: "League Spartan",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                AppLocalizations.of(context)!.orSign,
                style: TextStyle(
                  color: Color(0xffFFFDF9),
                  fontSize: 15,
                  fontFamily: "League Spartan",
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AuthSocial(icon: "assets/svg/insta.svg"),
                    AuthSocial(icon: "assets/svg/google.svg"),
                    AuthSocial(icon: "assets/svg/facebook.svg"),
                    AuthSocial(icon: "assets/svg/whatsapp.svg"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 55),
            GestureDetector(
              onTap:  () {
                context.go(Routes.signUp);
              },
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.dontAccount,
                  style: TextStyle(
                    color: Color(0xffFFFDF9),
                    fontSize: 15,
                    fontFamily: "League Spartan",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
