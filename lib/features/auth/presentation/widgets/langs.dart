import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/utils/colors.dart';

import '../../../../core/localization_view_model.dart';

class ChangeLangs extends StatelessWidget {
  const ChangeLangs({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<LocalizationViewModel>();
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Tilni tanlang/"
                    "Choose a language",
                    style: TextStyle(
                        color: AppColors.redPinkMain,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Switch(
                        value: vm.currentLocale.languageCode == "uz",
                        onChanged: (value) {
                          vm.currentLocale = Locale("uz");
                        },
                      ),
                      Text(
                        "🇺🇿 O'zbek tili",
                        style: TextStyle(
                            color: AppColors.pinkSub,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Switch(
                        value: vm.currentLocale.languageCode == "en",
                        onChanged: (value) {
                          vm.currentLocale = Locale("en");
                        },
                      ),
                      Text(
                        "🇺🇸 English",
                        style: TextStyle(
                            color: AppColors.pinkSub,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
      child: Text("${vm.currentLocale.languageCode=="en"?"🇺🇸":"🇺🇿"}",
      style: TextStyle(
        fontSize: 18,

      ),),
    );
  }
}
