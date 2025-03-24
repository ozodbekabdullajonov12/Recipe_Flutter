class OnboardingModel {
  final int id, order;
  final String title, subtitle, image;

  OnboardingModel({
    required this.id,
    required this.order,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      id: json["id"],
      order: json["order"],
      title: json["title"],
      subtitle: json["subtitle"],
      image: json["picture"],
    );
  }
}
