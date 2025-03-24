class IngredientModel {
  final int order;
  final String amount;
  final String? name;

  IngredientModel(
      {required this.order, required this.name, required this.amount});

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
        order: json["order"], amount: json["amount"], name: json["name"]);
  }
}
