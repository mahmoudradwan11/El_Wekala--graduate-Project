import 'package:el_wekala/modules/widgets/builders/mypainter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hexcolor/hexcolor.dart';
Widget buildGeneralItems(context) => Padding(
  padding: const EdgeInsets.only(left: 20,right: 20),
  child:  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          const Text('General',style: TextStyle(fontSize: 20),),
          const SizedBox(height: 10,),
          ClipRRect(
            borderRadius:BorderRadius.circular(10),
            child: Container(
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black.withOpacity(0.1))
              ),
              child: CustomPaint(
                painter: MyPainterGeneralSelected(),
                child: Row(
                  children: [
                    const SizedBox(width:10),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.language,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('Language & Country',style: TextStyle(color: Colors.black54),),
                          Text('English (united States)'),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 30,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          ClipRRect(
            borderRadius:BorderRadius.circular(10),
            child: Container(
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black.withOpacity(0.1))
              ),
              child: CustomPaint(
                painter: MyPainterGeneralSelected(),
                child: Row(
                  children: [
                    const SizedBox(width:10),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.person,
                        size: 25,

                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('Profile Setting',style: TextStyle(color: Colors.black54),),
                          Text('Mahmoud Radwan'),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 30,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          ClipRRect(
            borderRadius:BorderRadius.circular(10),
            child: Container(
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black.withOpacity(0.1))
              ),
              child: CustomPaint(
                painter: MyPainterGeneralSelected(),
                child: Row(
                  children: [
                    const SizedBox(width:10),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.edit_notifications,
                        size: 25,

                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('Notification',style: TextStyle(color: Colors.black54),),
                          Text('Email,Newsletter etc'),
                        ],
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 20,
                    width: 40,
                    child: NeumorphicSwitch(value:true,onChanged:(value){},style: NeumorphicSwitchStyle(
                      activeTrackColor: HexColor('#07094D'),
                      activeThumbColor: Colors.white,
                      inactiveThumbColor:Colors.white,

                    ),
                    ),
                  ),
                ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          ClipRRect(
            borderRadius:BorderRadius.circular(10),
            child: Container(
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black.withOpacity(0.1))
              ),
              child: CustomPaint(
                painter: MyPainterGeneralSelected(),
                child: Row(
                  children: [
                    const SizedBox(width:10),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.privacy_tip_outlined,
                        size: 25,

                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('Privacy'),
                          Text('Terms, Privacy'),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 30,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                     onTap: (){},
                    child: Text('Contact us',style: TextStyle(color:HexColor('#07094D')),)),
                const Spacer(),
                 InkWell(onTap: (){},
                     child: Text('SignOut',style: TextStyle(color:HexColor('#07094D')),)),
              ],
            ),
          ),
        ],
      ),
);
