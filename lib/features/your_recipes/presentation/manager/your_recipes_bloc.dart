import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/category_detail/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/your_recipes/presentation/manager/your_recipes_state.dart';

part 'your_recipes_events.dart';

class YourRecipesBloc extends Bloc<YourRecipesEvent, YourRecipesState> {
  final RecipeRepository _repo;

  YourRecipesBloc({required RecipeRepository repo})
      : _repo = repo,
        super(YourRecipesState.initial()) {
    on<YourRecipesLoading>(_loading);
    add(YourRecipesLoading());
  }

  Future<void> _loading(YourRecipesLoading event, Emitter emit) async {
    emit(state.copyWith(status: YourRecipesStatus.loading));
    final recipes = await _repo.fetchMyRecipes();
    final mostViewedTodayRecipes = await _repo.fetchMyRecipes(2);
    emit(YourRecipesState(
      recipes: recipes,
      mostViewedTodayRecipes: mostViewedTodayRecipes,
      status: YourRecipesStatus.idle,
    ));
  }
}
