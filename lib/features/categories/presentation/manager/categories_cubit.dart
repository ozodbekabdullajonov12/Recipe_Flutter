import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/category_model.dart';
import '../../data/repositories/categories_repository.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent,CategoriesState> {
  final CategoriesRepository _repo;

  CategoriesBloc({required CategoriesRepository repo})
      : _repo = repo,
        super(CategoriesState(
            categories: [],
            mainCategory: null,
            status: CategoriesStatus.loading)) {
    on<CategoriesLoading>(load);
    add(CategoriesLoading());
  }

  Future load(CategoriesLoading event,Emitter emit) async {
    final categories = await _repo.fetchCategories();
    emit(CategoriesState(
      categories: categories,
      mainCategory: categories.firstWhere((category) => category.main),
      status: CategoriesStatus.idle,
    ));
  }
}


class CategoriesEvent{}

class CategoriesLoading extends CategoriesEvent{}