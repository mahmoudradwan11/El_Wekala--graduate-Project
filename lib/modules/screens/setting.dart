import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/buildSettingItem.dart';
import 'package:el_wekala/modules/widgets/builders/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Container(
                              height: 31,
                              width: 28,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              )))),
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
                                child: Container(
                                  width: 71,
                                  height: 71,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage('images/Person.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Mahmoud Radwan',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'United States',
                                      style: TextStyle(color: Colors.grey),
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
                if (cubit.settingIndex == 2) Text('Notification settings'),
              ],
            ),
          ));
        });
  }
}
/*
class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.1),
        child: SizedBox(
          height: size.height * 0.1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: LayoutBuilder(
              builder: (context, con) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: CustomPaint(
                    painter: MyPainter(),
                    child: Row(
                      children: [
                        SizedBox(
                          width: con.maxWidth * 0.06,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.privacy_tip_outlined,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:const [
                               Text('Privacy'),
                               Text('Terms, Privacy'),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 20,
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = Colors.grey;
    final path = Path()
      ..lineTo(size.width * 0.2, 0)
      ..lineTo(0, size.height);
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false
}

 */
