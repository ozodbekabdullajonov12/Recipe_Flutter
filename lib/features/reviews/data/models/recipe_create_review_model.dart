class RecipeCreateReviewModel {
  final int id;
  final String title;
  final String image;

  RecipeCreateReviewModel({
    required this.image,
    required this.id,
    required this.title,
  });

  factory RecipeCreateReviewModel.fromJson(Map<String, dynamic> json) {
    return RecipeCreateReviewModel(
      id: json['id'],
      title: json['title'],
      image: json['photo'],
    );
  }
}
