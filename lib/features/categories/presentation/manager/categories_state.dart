part of 'categories_cubit.dart';
class CategoriesState {
  CategoriesState( {
    required this.categories,
    required this.mainCategory,
    required this.status
  });
  final List<CategoryModel> categories ;
  final CategoryModel? mainCategory;
  final CategoriesStatus status;
}



enum CategoriesStatus{idle,loading,error}  //enumerable