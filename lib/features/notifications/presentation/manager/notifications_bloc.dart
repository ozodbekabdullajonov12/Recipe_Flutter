import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/notifications/data/repositories/notifications_repository.dart';
import 'package:recipe_app/features/notifications/presentation/manager/notification_state.dart';
part 'notification_event.dart';

class NotificationsBloc extends Bloc<NotificationEvent, NotificationsState> {
  NotificationsBloc({
    required NotificationsRepository repo,
  })  : _repo = repo,
        super(NotificationsState.initial()) {
    on<NotificationLoading>(_onLoad);
  }

  final NotificationsRepository _repo;

  Future<void> _onLoad(
      NotificationLoading event,
      Emitter<NotificationsState> emit,
      ) async {
    emit(state.copyWith(notificationStatus: NotificationStatus.loading));
    try {
      final notifications = await _repo.fetchRecipeNotification();
      emit(
        state.copyWith(
          notification: notifications,
          notificationStatus: NotificationStatus.idle,
        ),
      );
    } catch (e) {
      emit(state.copyWith(notificationStatus: NotificationStatus.error));
    }
  }
}
