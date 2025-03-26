
import '../../data/models/notifications_model.dart';

enum NotificationStatus{idle, loading, error, success}

class NotificationsState extends Equatable{
  final List<NotificationsModel>? notification;
  final NotificationStatus notificationStatus;

  const NotificationsState({
    required this.notification,
    required this.notificationStatus
  });
  factory NotificationsState.initial(){
    return NotificationsState(
        notification: null,
        notificationStatus: NotificationStatus.loading
    );
  }
  NotificationsState copyWith({
    List<NotificationsModel>? notification,
    NotificationStatus? notificationStatus
  }){
    return NotificationsState(
        notification: notification ?? this.notification,
        notificationStatus: notificationStatus ?? this.notificationStatus
    );
  }
  @override
  List<Object> get props => [notification!, notificationStatus];
}

