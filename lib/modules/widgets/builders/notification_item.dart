import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/models/store_model/notification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildDirectionalDismess() => Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.centerRight,
        height: 100,
        width: double.infinity,
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.delete),
        ),
      ),
    );
Widget buildNotificationItem(Notifications notificationData, context) =>
    Dismissible(
      key: Key(notificationData.sId!),
      direction: DismissDirection.endToStart,
      background: buildDirectionalDismess(),
      onDismissed: (direction) {
        ElWekalaCubit.get(context).deleteNotification(notificationData.sId);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                    height: 50,
                    width: 50,
                    image: NetworkImage(
                        'https://th.bing.com/th/id/R.18070d466ffe28b755297974f5cb33e9?rik=bD%2fA7PEcBC0QyQ&pid=ImgRaw&r=0')),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notificationData.text!,
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy At HH--mm').format(
                          DateTime.tryParse(notificationData.createdAt!)!),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
