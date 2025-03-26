import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/features/notifications/data/models/notifications_model.dart';

class NotificationsRepository{
  final ApiClient client;

  List<NotificationsModel>? notification;
  NotificationsRepository({
    required this.client,
});
  Future<List<NotificationsModel>?>fetchRecipeNotification()async{
  List<NotificationsModel> notification = [];
  NotificationsRepository({required this.client});
  Future<List<NotificationsModel>>fetchRecipeNotification()async{
    var rawNotification = await client.genericGetRequest<List<dynamic>>('/notifications/list');
    notification = rawNotification.map((notification)=>NotificationsModel.fromJson(notification)).toList();
    return notification;
  }
}
