import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/modules/screens/edit_profile.dart';
import 'package:el_wekala/modules/screens/login.dart';
import 'package:el_wekala/modules/screens/policy.dart';
import 'package:el_wekala/modules/screens/report.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/builders/mypainter.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/cupertino.dart';
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
                        children: [
                          const Text('Profile Setting',style: TextStyle(color: Colors.black54),),
                          Text(ElWekalaCubit.get(context).profileModel!.user!.name!),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap:(){
                        navigateTo(context,EditProfile());
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 30,
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
                        children:const [
                          Text('Privacy',style: TextStyle(color: Colors.black54),),
                          Text('Terms, Privacy'),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap:(){
                        navigateTo(context,const Policy());
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 30,
                      ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                     onTap: (){
                       navigateTo(context,ContactUs());
                     },
                    child: Text('Contact us',style: TextStyle(color:HexColor('#07094D'),fontWeight: FontWeight.w600),),),
                InkWell(
                  onTap: (){
                    showCupertinoDialog(
                        context: context,
                        builder: (context) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: CupertinoAlertDialog(
                              content: Container(
                                height:160,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(25)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children:[
                                      const Text(
                                        'Are you sure you want to Delete Account?',style: TextStyle(fontSize:16,fontWeight: FontWeight.w600),),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Expanded(child: DefaultButton(buttonWidget:const Text('yes',style: TextStyle(color:Colors.white)), function:(){
                                            ElWekalaCubit.get(context).deleteUser(ElWekalaCubit.get(context).profileModel!.user!.email!);
                                            navigateTo(context, Login());
                                          },backgroundColor:HexColor('#07094D'),width: 122,radius: 25,)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(child: DefaultButton(buttonWidget:Text('No',style: TextStyle(color: HexColor('#07094D')),), function:(){
                                            Navigator.pop(context);
                                          },backgroundColor:Colors.white,borderColor:HexColor('#07094D'),width: 122,radius: 25,),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                        )
                    );
                  },
                  child: Text('Delete Account',style: TextStyle(color:HexColor('#07094D'),fontWeight: FontWeight.w600),),),
                InkWell(onTap: (){
                   showCupertinoDialog(
                       context: context,
                       builder: (context) => Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10)),
                         child: CupertinoAlertDialog(
                           content: Container(
                             height:160,
                             decoration: BoxDecoration(
                                 borderRadius:
                                 BorderRadius.circular(25)),
                             child: Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Column(
                                 children:[
                                   const Text(
                                     'Are you sure you want to Signout?',style: TextStyle(fontSize:16,fontWeight: FontWeight.w600),),
                                   const Spacer(),
                                   Row(
                                     children: [
                                        Expanded(child: DefaultButton(buttonWidget:const Text('yes',style: TextStyle(color:Colors.white)), function:(){
                                          ElWekalaCubit.get(context).layout(context);
                                        },backgroundColor:HexColor('#07094D'),width: 122,radius: 25,)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(child: DefaultButton(buttonWidget:Text('No',style: TextStyle(color: HexColor('#07094D')),), function:(){
                                          Navigator.pop(context);
                                        },backgroundColor:Colors.white,borderColor:HexColor('#07094D'),width: 122,radius: 25,),),
                                     ],
                                   )
                                 ],
                               ),
                             ),
                           ),
                         )
                   )
                   );
                 },
                     child: Text('SignOut',style: TextStyle(color:HexColor('#07094D'),fontWeight: FontWeight.w600),)),
              ],
            ),
          ),
        ],
      ),

);
