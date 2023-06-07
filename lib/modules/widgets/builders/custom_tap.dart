import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/models/store_model/custom_tap.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildCustomTapBar(CustomTapBar customTapBar,index,context)=>InkWell(
  onTap: (){
    ElWekalaCubit.get(context).change(index);
  },
  child: Container(
    width: 63,
    height: 40,
      decoration: BoxDecoration(

          gradient:ElWekalaCubit.get(context).chooseColorCustom(index),
          borderRadius: BorderRadius.circular(6)
      ),
  child: Center(child: Text(customTapBar.title!,style:TextStyle(color:ElWekalaCubit.get(context).customIndex==index?Colors.white:HexColor('#000000')),)),
  )
);