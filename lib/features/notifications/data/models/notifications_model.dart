class NotificationsModel {
  final int id;
  final String title;
  final String subtitle;
  final String date;

  NotificationsModel({
    required this.id,
    required this.title,
    required this.date,
    required this.subtitle,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      subtitle: json['subtitle'],
    );
  }
}
