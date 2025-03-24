class InstructionModel {
  final int order;
  final String text;

  InstructionModel({
    required this.order,
    required this.text,
  });

  factory InstructionModel.fromJson(Map<String, dynamic> json) {
    return InstructionModel(
      order: json["order"],
      text: json["text"],
    );
  }
}
