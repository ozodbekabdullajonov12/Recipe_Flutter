import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_flutter_app_bar.dart';
import 'package:recipe_app/features/recipe_create/presentation/pages/recipe_create_add_video.dart';
import 'package:recipe_app/features/recipe_create/presentation/pages/recipe_create_instructions_item.dart';
import 'package:recipe_app/features/recipe_create/presentation/pages/recipe_text_button_container.dart';
import 'package:recipe_app/features/recipe_create/presentation/pages/recipe_text_form_field.dart';
import '../../../../core/presentation/widgets/recipe_bottom_bar.dart';
import '../../../../core/utils/colors.dart';
import 'recipe_create_ingredient_item.dart';
import 'package:recipe_app/features/recipe_create/presentation/manager/recipe_create_bloc.dart';
import 'package:recipe_app/features/recipe_create/presentation/manager/recipe_create_state.dart';

class RecipeCreateView extends StatefulWidget {
  const RecipeCreateView({super.key});

  @override
  State<RecipeCreateView> createState() => _RecipeCreateViewState();
}

class _RecipeCreateViewState extends State<RecipeCreateView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = ScrollController();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeController = TextEditingController();

  List<Map<String, TextEditingController>> ingredients = [];
  List<TextEditingController> instructions = [];
  String title = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeCreateBloc(),
      child: Scaffold(
        extendBody: true,
        appBar: RecipeAppBarFlutter(
          title: "Create Recipe",
          actions: [],
        ),
        body: BlocBuilder<RecipeCreateBloc, RecipeCreateState>(
          builder: (context, state) {
            return ListView(
              controller: controller,
              padding: EdgeInsets.fromLTRB(36.w, 20.h, 36.w, 120.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeTextButtonContainer(
                      text: "Publish",
                      textColor: AppColors.pinkSub,
                      containerColor: AppColors.pink,
                      callback: () {
                        if (formKey.currentState?.validate() ?? false) {
                          context.read<RecipeCreateBloc>().add(RecipeCreateSubmit(
                            title: titleController.text,
                            description: descriptionController.text,
                            timeRequired: timeController.text,
                            ingredients: ingredients,
                            instructions: instructions,
                          ));
                        }
                      },
                      containerWidth: 177.w,
                      containerHeight: 27.h,
                    ),
                    RecipeTextButtonContainer(
                      text: "Delete",
                      textColor: AppColors.pinkSub,
                      containerColor: AppColors.pink,
                      callback: () {},
                      containerWidth: 177.w,
                      containerHeight: 27.h,
                    ),
                  ],
                ),
                SizedBox(height: 26.h),
                RecipeCreateAddVideo(),
                SizedBox(height: 26.h),
                Form(
                  key: formKey,
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RecipeTextFormField(
                        label: "Title",
                        hintText: "Recipe Title",
                        controller: titleController,
                      ),
                      RecipeTextFormField(
                        label: "Description",
                        hintText: "Recipe Description",
                        minLines: 2,
                        maxLines: 3,
                        controller: descriptionController,
                      ),
                      RecipeTextFormField(
                        label: "Time Required (mins)",
                        hintText: "15, 25, 30...",
                        controller: timeController,
                      ),
                      Text(
                        "Ingredients",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ReorderableListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for (int i = 0; i < ingredients.length; i++)
                            Padding(
                              key: ValueKey(i),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: RecipeCreateIngredientItem(
                                index: i,
                                amtController: ingredients[i]['amt']!,
                                ingrController: ingredients[i]['ingr']!,
                                callback: () {
                                  ingredients.removeAt(i);
                                  setState(() {});
                                },
                              ),
                            ),
                        ],
                        onReorder: (oldIndex, newIndex) {
                          if (newIndex > oldIndex) newIndex--;
                          final oldIngredient = ingredients.removeAt(oldIndex);
                          ingredients.insert(newIndex, oldIngredient);
                          setState(() {});
                        },
                      ),
                      Center(
                        child: RecipeTextButtonContainer(
                          text: "+ Add Ingredient",
                          textColor: AppColors.beigeColor,
                          containerColor: AppColors.redPinkMain,
                          containerWidth: 211.w,
                          containerHeight: 35.h,
                          callback: () {
                            ingredients.add({
                              "amt": TextEditingController(),
                              "ingr": TextEditingController()
                            });
                            setState(() {});
                            controller.animateTo(
                              controller.offset + 72,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOutExpo,
                            );
                          },
                        ),
                      ),
                      Text(
                        "Instructions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ReorderableListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for (int i = 0; i < instructions.length; i++)
                            Padding(
                              key: ValueKey(i),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: RecipeCreateInstructionItem(
                                index: i,
                                instController: instructions[i],
                                callback: () {
                                  instructions.removeAt(i);
                                  setState(() {});
                                },
                              ),
                            ),
                        ],
                        onReorder: (oldIndex, newIndex) {
                          if (newIndex > oldIndex) newIndex--;
                          final oldIngredient = instructions.removeAt(oldIndex);
                          instructions.insert(newIndex, oldIngredient);
                          setState(() {});
                        },
                      ),
                      Center(
                        child: RecipeTextButtonContainer(
                          text: "+ Add Instruction",
                          textColor: AppColors.beigeColor,
                          containerColor: AppColors.redPinkMain,
                          containerWidth: 211.w,
                          containerHeight: 35.h,
                          callback: () {
                            instructions.add(TextEditingController());
                            setState(() {});
                            controller.animateTo(
                              controller.offset + 72,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOutExpo,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
