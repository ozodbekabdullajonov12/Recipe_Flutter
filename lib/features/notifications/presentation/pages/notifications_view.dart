import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/presentation/widgets/RecipeFlutterAppbar.dart';
import '../../../../core/presentation/widgets/recipe_bottom_bar.dart';
import '../manager/notification_bloc.dart';
import '../manager/notification_state.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotificationsBloc>(context).add(NotificationLoading());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBarFlutter(
        title: "Notifications",
        actions: [],
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          if (state.status == NotificationsStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == NotificationsStatus.error) {
            return Center(child: Text('Error'));
          }
          return ListView(padding: EdgeInsets.only(bottom: 100), children: [
            Text(
              state.notification![0].subtitle,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]);
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
