import 'package:el_wekala/models/store_model/message.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget builtMessage(Messages model,context)=>Align(
  alignment: AlignmentDirectional.centerStart,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration:const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
            bottomStart: Radius.circular(10.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Text(model.content!),
      ),
    ],
  ),
);
Widget builtMyMessage(Messages model,context)=>Align(
  alignment: AlignmentDirectional.centerEnd,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        decoration:BoxDecoration(
          color:HexColor('#07094D'),
          borderRadius:const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10.0),
            bottomEnd:Radius.circular(10.0),
            topStart: Radius.circular(10.0),
          ),
        ),
        padding:const EdgeInsets.symmetric(
          vertical:5.0,
          horizontal:10.0,
        ),
        child: Text(model.content!,style:const TextStyle(color: Colors.white)),

      ),
    ],
  ),
);