import 'package:equatable/equatable.dart';
import '../../data/models/notifications_model.dart';

enum NotificationStatus{idle, loading, error, success}

class NotificationState extends Equatable{
  final List<NotificationsModel>? notification;
  final NotificationStatus notificationStatus;

  const NotificationState({
    required this.notification,
    required this.notificationStatus
  });
  factory NotificationState.initial(){
    return NotificationState(
        notification: null,
        notificationStatus: NotificationStatus.loading
    );
  }
  NotificationState copyWith({
    List<NotificationsModel>? notification,
    NotificationStatus? notificationStatus
  }){
    return NotificationState(
        notification: notification ?? this.notification,
        notificationStatus: notificationStatus ?? this.notificationStatus
    );
  }
  @override
  List<Object> get props => [notification, notificationStatus];
}

