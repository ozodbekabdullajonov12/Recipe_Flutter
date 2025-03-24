class TrendingRecipeModel {
  final int id;
  final int categoryId;
  final String title;
  final String description, photo;
  final num timeRequired, rating;

  TrendingRecipeModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photo,
    required this.rating,
    required this.timeRequired,
  });

  factory TrendingRecipeModel.fromJson(Map<String, dynamic> json) {
    return TrendingRecipeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      rating: json['rating'],
      timeRequired: json['timeRequired'],
    );
  }
}
