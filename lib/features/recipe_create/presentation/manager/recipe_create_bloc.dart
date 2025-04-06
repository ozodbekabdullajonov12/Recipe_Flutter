import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/recipe_create/presentation/manager/recipe_create_state.dart';

part 'recipe_create_events.dart';

class RecipeCreateBloc extends Bloc<RecipeCreateEvent, RecipeCreateState> {
  RecipeCreateBloc() : super(RecipeCreateState.initial()) {
    on<RecipeCreateSubmit>(_onSubmit);
    on<RecipeCreateAddIngredient>(_onAddIngredient);
  }

  Future<void> _onSubmit(
      RecipeCreateSubmit event, Emitter<RecipeCreateState> emit) async {
    print("Banzaaaaaaay");
  }

  Future<void> _onAddIngredient(
      RecipeCreateAddIngredient event, Emitter<RecipeCreateState> emit) async {
    List<Map<String, String>> updatedIngredients = List.from(state.ingredients);
    updatedIngredients.add({
      'ingredient': event.ingredientName,
      'amount': event.ingredientAmount,
    });

    emit(
      state.copyWith(
        ingredientsCount: state.ingredientsCount + 1,
        ingredients: updatedIngredients,
      ),
    );
  }
}
