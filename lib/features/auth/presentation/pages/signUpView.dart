import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/l10n/app_localization.dart';
import 'package:recipe_app/features/auth/presentation/widgets/auth_form_text.dart';

import '../../../../core/presentation/widgets/recipe_elevated_button.dart';
import '../../../../core/utils/colors.dart';
import '../manager/sign_up_view_model.dart';
import '../widgets/langs.dart';
import '../widgets/password_text_form.dart';
import '../widgets/sign_date_of_birth.dart';
import '../widgets/sign_up_dialog.dart';
import '../widgets/sign_up_view_login_texts.dart';



class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(repo: context.read()),
      builder: (context, child) {
        var vm = context.watch<SignUpViewModel>();
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            title: Text(
              AppLocalizations.of(context)!.signUp,
              style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              Align(
                  alignment: Alignment.centerRight,
                  child: ChangeLangs()),
              SizedBox(width: 6,)
            ],
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            children: [
              Form(
                key: vm.formKey,
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthFormText(
                      controller: vm.nameController,
                      hintText: "Maknun",
                      validator: (value) => null,
                      label: AppLocalizations.of(context)!.name,
                      errorText: null,
                    ),
                    AuthFormText(
                      controller: vm.surnameController,
                      hintText: "Mirzo",
                      validator: (value) => null,
                      label: AppLocalizations.of(context)!.surname,
                      errorText: null,
                    ),
                    AuthFormText(
                      controller: vm.usernameController,
                      hintText: "@maknunmirzo",
                      validator: (value) => null,
                      label: AppLocalizations.of(context)!.username,
                      errorText: null,
                    ),
                    AuthFormText(
                      controller: vm.emailController,
                      hintText: "example@example.com",
                      validator: (value) => null,
                      label: AppLocalizations.of(context)!.email,
                      errorText: null,
                    ),
                    AuthFormText(
                      controller: vm.numberController,
                      hintText: "+ 123 456 789",
                      validator: (value) => null,
                      label: AppLocalizations.of(context)!.mobileNumber,
                      errorText: null,
                    ),
                    SignDateOfBirth(),
                    PasswordTextForm(
                      isShowPassword: vm.showObscureText,
                      suffixOnTap: () {
                        vm.showPassword();
                      },
                      controller: vm.passwordController,
                      errorText: null,
                      label: AppLocalizations.of(context)!.password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    PasswordTextForm(
                      isShowPassword: vm.confirmShowObscureText,
                      suffixOnTap: () {
                        vm.confirmShowPassword();
                      },
                      controller: vm.confirmPasswordController,
                      label: AppLocalizations.of(context)!.confirmPassword,
                      errorText: null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        if (vm.passwordController.text !=
                            vm.confirmPasswordController.text) {
                          return "passwords are not match";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SignUpViewDescription(),
              Center(
                child: RecipeElevatedButton(
                  text: AppLocalizations.of(context)!.signUp,
                  callback: () async {
                    if (vm.formKey.currentState!.validate()) {
                      if (await vm.signUp() && context.mounted) {
                        showDialog(
                          context: context,
                          useSafeArea: true,
                          barrierColor: Colors.black54,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return SignUpDialog();
                          },
                        );
                      }
                    }
                  },
                  size: Size(194, 45),
                  backgroundColor: AppColors.redPinkMain,
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              SignUpViewLoginText(),
              SizedBox(height: 40)
            ],
          ),
        );
      },
    );
  }
}
