import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/trending_recipes/presentation/manager/trending_recipe_state.dart';
import '../../../category_detail/data/repositories/recipe_repository.dart';
part 'trending_recipe_event.dart';

class TrendingRecipeBloc extends Bloc<TrendingRecipeEvent, TrendingRecipeState> {
  TrendingRecipeBloc({
    required RecipeRepository recipeRepo,
  })  : _recipeRepo = recipeRepo,
        super(TrendingRecipeState.initial()) {
    on<TrendingRecipeLoading>(_onLoad);
  }

  final RecipeRepository _recipeRepo;

  Future<void> _onLoad(
      TrendingRecipeLoading event,
      Emitter<TrendingRecipeState> emit,
      ) async {
    emit(state.copyWith(status: TrendingRecipeStatus.loading));
    try {
      final recipes = await _recipeRepo.fetchTrendingRecipes();
      final recipe = await _recipeRepo.fetchTrendingRecipeForToday();
      emit(
        state.copyWith(
          recipes: recipes,
          recipesForMostViewed: recipe,
          status: TrendingRecipeStatus.idle,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: TrendingRecipeStatus.error));
    }
  }
}
