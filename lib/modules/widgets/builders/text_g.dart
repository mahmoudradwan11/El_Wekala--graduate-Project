import 'package:flutter/material.dart';

const PVSpace10 = SizedBox(width: 0.0, height: 10.0);
const PVSpace20 = SizedBox(width: 0.0, height: 20.0);
const PVSpace30 = SizedBox(width: 0.0, height: 30.0);
const PHSpace10 = SizedBox(width: 10.0, height: 0.0);
Widget buildTextForm(
    BuildContext context,
    double height, {
      TextEditingController? buttonController,
      double? width,
      String? title,
      double?fontSize = 16.0,
      Color?color = Colors.black,
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title!,
        style:const TextStyle(fontFamily: 'Jannah',fontSize: 20),
      ),
      PVSpace10,
      Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color:Colors.black, width: 1.0),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: buttonController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    ],
  );
}