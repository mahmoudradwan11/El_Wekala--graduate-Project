import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key, this.model}) : super(key: key);
  var model;
  //TabController _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'images/setting_icon.svg',
                      height: 10,
                    ),
                  )),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Text(model.name)),
                      Container(
                          decoration: BoxDecoration(
                              color: HexColor('#E6E7E8'),
                              borderRadius: BorderRadius.circular(6)),
                          height: 30,
                          width: 30,
                          child: const Center(
                              child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  height: 180,
                  child:const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.Iz0zsCWRLShBbAp7VkorxwHaEK?w=321&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.changeView(0);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: cubit.currentTabViewIndex == 0
                                  ? Border(
                                bottom: BorderSide(color: HexColor('#07094D'))
                              )
                                  : null,
                            ),
                            child:const Center(child:Text('Overview')),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.changeView(1);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: cubit.currentTabViewIndex == 1
                                  ? Border(
                                  bottom: BorderSide(color: HexColor('#07094D'))
                              )
                                  : null,
                            ),
                            child: const Center(child: Text('Specification')),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.changeView(2);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: cubit.currentTabViewIndex == 2
                                  ? Border(
                                  bottom: BorderSide(color: HexColor('#07094D'))
                              )
                                  : null,
                            ),
                            child: const Center(child: Text('Review')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                cubit.tabViews[cubit.currentTabViewIndex]
              ]),
            ),
          );
        });
  }
}
