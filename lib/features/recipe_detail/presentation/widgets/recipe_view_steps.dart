import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/recipe_detail/data/models/instruction_model.dart';
import 'package:recipe_app/features/recipe_detail/presentation/widgets/recipe_view_label.dart';

class RecipeViewSteps extends StatelessWidget {
  const RecipeViewSteps({super.key, required this.rawInstruction});

  final List<InstructionModel> rawInstruction;

  @override
  Widget build(BuildContext context) {
    List<InstructionModel> instructions = List.from(rawInstruction);
    instructions.sort((a, b) => a.order.compareTo(b.order));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecipeViewLabel(label: "${rawInstruction.length} Easy Steps"),
        SizedBox(
          height: 15,
        ),
        Column(
          spacing: 10,
          children: List.generate(
            instructions.length,
            (index) => Container(
              width: double.infinity,
              height: 81.h,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: (index % 2 == 1) ? AppColors.pinkSub : Colors.pink),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${instructions[index].order}. ",
                    style: TextStyle(
                      color: Color(0xff1C0F0D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    softWrap: true,
                  ),
                  SizedBox(
                    width: 337.w,
                    child: Text(
                      instructions[index].text,
                      style: TextStyle(
                        color: Color(0xff1C0F0D),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
