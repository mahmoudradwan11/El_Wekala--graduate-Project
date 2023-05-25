import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/buildSettingItem.dart';
import 'package:el_wekala/modules/widgets/builders/general.dart';
import 'package:el_wekala/modules/widgets/builders/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          if(cubit.profileModel==null){
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.black,
                size: 20,
              ));
          }else {
            return Scaffold(
              body: SingleChildScrollView(
            child:Column(
              children: [
                Container(
                  height: 280,
                  color: Colors.white,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      const Image(image: AssetImage('images/setting.png')),
                      const Positioned(
                          top: 50,
                          left: 80,
                          child: Text(
                            'Settings',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Jannah',
                                fontSize: 20),
                          )),
                      Positioned(
                          top: 55,
                          left: 30,
                          child: SvgPicture.asset('images/setting_icon.svg')
                      ),
                      const Positioned(
                          top: 60,
                          right: 20,
                          child: Image(image: AssetImage('images/search.png'))),
                      const Positioned(
                          top: 110,
                          right: 25,
                          child:Image(image: AssetImage('images/circle.png'),)
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 110),
                        child: Container(
                          height: 71,
                          width: double.infinity,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30,right: 30),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(cubit.profileModel!.user!.profileImage!),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    Text(
                                      cubit.profileModel!.user!.name!,
                                      style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                     Text(
                                      cubit.profileModel!.user!.email!,
                                      style:const TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 210, left: 25),
                        child: Container(
                          height: 62,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => buildSettingItem(
                                  cubit.setting[index], index, context),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 10,
                                  ),
                              itemCount: cubit.setting.length),
                        ),
                      ),
                    ],
                  ),
                ),
                if (cubit.settingIndex == 0) buildGeneralItems(context),
                if (cubit.settingIndex == 1) Text('Payment'),
                if (cubit.settingIndex == 2) buildNotificationUi(context),
              ],
            ),
          ));
          }
        });
  }
}
