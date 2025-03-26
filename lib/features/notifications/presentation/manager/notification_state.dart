import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe_app/features/notifications/data/models/notifications_model.dart';

enum NotificationsStatus { idle, loading, error }

@immutable
class NotificationsState extends Equatable {
  final NotificationsStatus status;
  final List<NotificationsModel>? notification;

  const NotificationsState({
    required this.status,
    required this.notification,
  });

  NotificationsState copyWith({
    NotificationsStatus? status,
    List<NotificationsModel>? notifications,
  }) {
    return NotificationsState(
        status: status ?? this.status,
        notification: notification ?? this.notification);
  }

  @override
  List<Object> get props => [status, notification!];

  factory NotificationsState.initial()  {
    return const NotificationsState(
      status: NotificationsStatus.loading,
      notification: [],
    );
  }
}
