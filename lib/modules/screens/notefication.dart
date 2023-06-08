import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/divider.dart';
import 'package:el_wekala/modules/widgets/builders/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Notifications'),
            ),
            body: ListView.separated(
              itemBuilder: (context, index) => buildNotificationItem(
                  cubit.notificationModel!.notifications![index]),
              separatorBuilder: (context, index) => BuildDivider(),
              itemCount: cubit.notificationModel!.notifications!.length,
            ),
          );
        });
  }
}
