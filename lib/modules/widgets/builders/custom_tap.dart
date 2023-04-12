import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/models/store_model/custom_tap.dart';
import 'package:flutter/material.dart';

Widget BuildCustomTapBar(CustomTapBar customTapBar,index,context)=>InkWell(
  onTap: (){
    ElWekalaCubit.get(context).change(index);
  },
  child: Container(
    width: 60,
    height: 40,
      decoration: BoxDecoration(
          gradient:ElWekalaCubit.get(context).chooseColorCustom(index),
          borderRadius: BorderRadius.circular(10)
      ),
  child: Center(child: Text(customTapBar.title!,style:const TextStyle(color:Colors.white),)),
  )
);