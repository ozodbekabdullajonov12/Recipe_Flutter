import 'package:equatable/equatable.dart';
import 'package:recipe_app/features/top_chef/data/models/top_chef_model.dart';

enum TopChefsStatus { idle, loading, success, error }

class TopChefsState extends Equatable {
  @override
  List<Object?> get props => [
        mostLikedChefs,
        mostLikedChefsStatus,
        mostViewedChefs,
        mostViewedChefsStatus,
        newChefs,
        newChefsStatus,
      ];

  final List<TopChefModel> newChefs;
  final List<TopChefModel> mostLikedChefs;
  final List<TopChefModel> mostViewedChefs;

  final TopChefsStatus newChefsStatus;
  final TopChefsStatus mostLikedChefsStatus;
  final TopChefsStatus mostViewedChefsStatus;

  const TopChefsState({
    required this.newChefs,
    required this.mostLikedChefs,
    required this.mostViewedChefs,
    required this.newChefsStatus,
    required this.mostLikedChefsStatus,
    required this.mostViewedChefsStatus,
  });

  factory TopChefsState.initial() {
    return TopChefsState(
      newChefs: [],
      mostLikedChefs: [],
      mostViewedChefs: [],
      newChefsStatus: TopChefsStatus.idle,
      mostLikedChefsStatus: TopChefsStatus.idle,
      mostViewedChefsStatus: TopChefsStatus.idle,
    );
  }


  TopChefsState copyWith({
    List<TopChefModel>? mostViewedChefs,
    List<TopChefModel>? mostLikedChefs,
    List<TopChefModel>? newChefs,
    TopChefsStatus? mostViewedChefsStatus,
    TopChefsStatus? mostLikedChefsStatus,
    TopChefsStatus? newChefsStatus,
  }) {
    return TopChefsState(
      mostViewedChefs: mostViewedChefs ?? this.mostViewedChefs,
      mostViewedChefsStatus: mostViewedChefsStatus ?? this.mostViewedChefsStatus,
      mostLikedChefs: mostLikedChefs ?? this.mostLikedChefs,
      mostLikedChefsStatus: mostLikedChefsStatus ?? this.mostLikedChefsStatus,
      newChefs: newChefs ?? this.newChefs,
      newChefsStatus: newChefsStatus ?? this.newChefsStatus,
    );
  }
}
