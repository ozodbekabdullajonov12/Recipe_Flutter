import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/top_chef/presentation/manager/top_chefs_state.dart';

import '../../../profile/data/repositories/chef_repository.dart';

part 'top_chef_event.dart';

class TopChefsBloc extends Bloc<TopChefsEvent, TopChefsState> {
  TopChefsBloc({required ChefRepository chefRepo})
      : _chefRepo = chefRepo,
        super(TopChefsState.initial()) {
    on<TopChefsLoading>(_onLoad);
    add(TopChefsLoading());
  }

  final ChefRepository _chefRepo;

  Future<void> _onLoad(
      TopChefsLoading event, Emitter<TopChefsState> emit) async {
    emit(
      state.copyWith(
        mostViewedChefsStatus: TopChefsStatus.loading,
        mostLikedChefsStatus: TopChefsStatus.loading,
        newChefsStatus: TopChefsStatus.loading,
      ),
    );

    final mostViewedChefs = await _chefRepo.fetchMostViewedChefs();
    emit(state.copyWith(
        mostViewedChefs: mostViewedChefs,
        mostViewedChefsStatus: TopChefsStatus.success));
    final mostLikedChefs = await _chefRepo.fetchMostLikedChefs();
    emit(state.copyWith(
        mostLikedChefs: mostLikedChefs,
        mostLikedChefsStatus: TopChefsStatus.success));
    final newChefs = await _chefRepo.fetchNewChefs();
    emit(state.copyWith(
        newChefs: newChefs, newChefsStatus: TopChefsStatus.success));
  }
}
