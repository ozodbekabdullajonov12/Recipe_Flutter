import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/features/notifications/presentation/manager/notification_state.dart';
import 'package:recipe_app/features/notifications/presentation/manager/notifications_bloc.dart';
import '../../../../core/utils/colors.dart';
import 'notification_view_section.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beigeColor,
      appBar: AppBar(
        backgroundColor: AppColors.beigeColor,
        centerTitle: true,
        leading: Center(
          child: SvgPicture.asset('assets/svg/back.svg'),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
              color: AppColors.redPinkMain,
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          if (state.notificationStatus == NotificationStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }  else if (state.notificationStatus == NotificationStatus.idle) {
          }
          return ListView(
            children: [
              for(var notification in state.notification!)NotificationViewToday(title:notification.title,subTitle: notification.subtitle,dateTime: notification.date)
            ],
          );
        }
      ),
    );
  }
}
