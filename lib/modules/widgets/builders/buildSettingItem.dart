import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/models/store_model/setting%20model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Widget buildSettingItem(SettingModel settingModel, index, context) => InkWell(
      onTap: () {
        ElWekalaCubit.get(context).changeSetting(index);
      },
      child: Card(
        color: Colors.transparent,
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: index == 2 ? 150 : 130,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: CustomPaint(
                painter: ElWekalaCubit.get(context).chooseColorSetting(index),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(
                            settingModel.icon,
                            color: Colors.black,
                            size: 20,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(settingModel.title!)
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
