import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildNotificationUi(context)=>Padding(
  padding: const EdgeInsets.only(left: 20,right: 20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      const Text('Notifications settings',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
      const SizedBox(
        height: 10,
      ),
      Container(
        decoration:BoxDecoration(
            color: HexColor('#F2F2F2'),
            borderRadius: BorderRadius.circular(10)
        ),
        width: double.infinity,
        height:101,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const Text('Your Account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
              Text('Get notified for account alerts',style: TextStyle(color: HexColor('#000000'),fontWeight: FontWeight.w600,fontSize:12,),),
              Row(
                children: [
                  const Text('Important Messages Alerts',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:14,)),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 25,
                      width: 45,
                      child: NeumorphicSwitch(value:ElWekalaCubit.get(context).swi,onChanged:(value){
                        ElWekalaCubit.get(context).changeSwi();
                      },style: NeumorphicSwitchStyle(
                        activeTrackColor: HexColor('#07094D'),
                        activeThumbColor: Colors.white,
                        inactiveThumbColor:Colors.white,

                      ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        decoration:BoxDecoration(
            color: HexColor('#F2F2F2'),
            borderRadius: BorderRadius.circular(10)
        ),
        width: double.infinity,
        height:98,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const Text('Your Shipments',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
              Text('Find out when packages ship & arrive',style: TextStyle(color: HexColor('#000000'),fontWeight: FontWeight.w600,fontSize:10,),),
              Row(
                children: [
                  const Text('Shipment Notifications',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:14,)),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 25,
                      width: 45,
                      child: NeumorphicSwitch(value:ElWekalaCubit.get(context).swi,onChanged:(value){
                        ElWekalaCubit.get(context).changeSwi();
                      },style: NeumorphicSwitchStyle(
                        activeTrackColor: HexColor('#07094D'),
                        activeThumbColor: Colors.white,
                        inactiveThumbColor:Colors.white,
                      ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        decoration:BoxDecoration(
            color: HexColor('#F2F2F2'),
            borderRadius: BorderRadius.circular(10)
        ),
        width: double.infinity,
        height:105,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const Text('Your Recommendations',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
              Text('Receive recommendations based on your shoping activity',style: TextStyle(color: HexColor('#000000'),fontWeight: FontWeight.w600,fontSize:10,),),
              Row(
                children: [
                  const Text('Personalized Notifications',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:14,)),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 25,
                      width: 45,
                      child: NeumorphicSwitch(value:ElWekalaCubit.get(context).swi,onChanged:(value){
                        ElWekalaCubit.get(context).changeSwi();
                      },style: NeumorphicSwitchStyle(
                        activeTrackColor: HexColor('#07094D'),
                        activeThumbColor: Colors.white,
                        inactiveThumbColor:Colors.white,
                      ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        decoration:BoxDecoration(
            color: HexColor('#F2F2F2'),
            borderRadius: BorderRadius.circular(10)
        ),
        width: double.infinity,
        height:98,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const Text('Your Watched & Waitlisted Deals',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
              Text('Find out when Lightiing Deals Happen',style: TextStyle(color: HexColor('#000000'),fontWeight: FontWeight.w600,fontSize:10,),),
              Row(
                children: [
                  const Text('Your Watched & Waitlisted Deals',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:14,)),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 25,
                      width: 45,
                      child: NeumorphicSwitch(value:ElWekalaCubit.get(context).swi,onChanged:(value){
                        ElWekalaCubit.get(context).changeSwi();
                      },style: NeumorphicSwitchStyle(
                        activeTrackColor: HexColor('#07094D'),
                        activeThumbColor: Colors.white,
                        inactiveThumbColor:Colors.white,
                      ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        decoration:BoxDecoration(
            color: HexColor('#F2F2F2'),
            borderRadius: BorderRadius.circular(10)
        ),
        width: double.infinity,
        height:96,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const Text('Your Wekala Community',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
              Text('Receive updates form Spark, Customer Q&A, Reviews, follow,and more',style: TextStyle(color: HexColor('#000000'),fontWeight: FontWeight.w600,fontSize:8,),),
              Row(
                children: [
                  const Text('Community Notifications',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize:14,)),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 25,
                      width: 45,
                      child: NeumorphicSwitch(value:ElWekalaCubit.get(context).swi,onChanged:(value){
                        ElWekalaCubit.get(context).changeSwi();
                      },style: NeumorphicSwitchStyle(
                        activeTrackColor: HexColor('#07094D'),
                        activeThumbColor: Colors.white,
                        inactiveThumbColor:Colors.white,
                      ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 100,
      ),
    ],
  ),
);