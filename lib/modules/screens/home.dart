import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar:
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: HexColor('#07094D'),
                    borderRadius: BorderRadius.circular(23)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, bottom: 10, top: 8),
                  child: GNav(
                    tabBorderRadius:23,
                    gap: 7,
                    backgroundColor: Colors.transparent,
                    color: Colors.white,
                    activeColor:HexColor('#07094D'),
                    tabBackgroundColor: Colors.white,
                    onTabChange: (index) {
                      cubit.changeIndex(index);

                    },
                    padding: const EdgeInsets.only(left: 13,bottom: 6,right: 13,top: 6),
                    tabs: cubit.tabs,
                  ),
                ),
              ),
            ),
          );
        }
        );
  }
}
