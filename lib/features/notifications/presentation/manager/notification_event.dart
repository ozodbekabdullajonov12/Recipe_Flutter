part of "notifications_bloc.dart";


sealed class NotificationEvent{}

class NotificationLoading extends NotificationEvent {
  NotificationLoading();
}
