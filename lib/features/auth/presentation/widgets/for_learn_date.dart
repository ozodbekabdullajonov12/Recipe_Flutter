import "package:board_datetime_picker/board_datetime_picker.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart";

class ForLearnDate extends StatefulWidget {
  const ForLearnDate({super.key});

  @override
  State<ForLearnDate> createState() => _ForLearnDateState();
}

class _ForLearnDateState extends State<ForLearnDate> {
  DateTime? dateText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RecipeElevatedButton(
              text: "Select date",
              size: Size(300, 100),
              callback: () async {
                DateTime? picked = await showBoardDateTimePicker(
                  context: context,
                  pickerType: DateTimePickerType.date,
                );
                
                if (picked != null) {
                  setState(() {
                    dateText = picked;
                  });
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              dateText == null
                  ? "88/88/8888"
                  : DateFormat("dd/MM/yyyy").format(dateText!),
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
