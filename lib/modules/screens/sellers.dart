import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/build_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class SellersScreen extends StatelessWidget {
  SellersScreen({Key? key,this.image,this.name}) : super(key: key);
  var image;
  var name;
  @override
  Widget build(BuildContext context){
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state){
          var cubit = ElWekalaCubit.get(context);
          if(cubit.sellersModel==null){
            return Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'images/setting_icon.svg',
                      height: 31,
                    ),
                  ),
                ),
              ),
              body:const Center(
                child:
              CircularProgressIndicator(),),
            );
          }
          return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap:(){
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'images/setting_icon.svg',
                  height: 31,
                ),
              ),
            ),
          ),
            body: SingleChildScrollView(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 1,
                  ),
                  Container(
                      height:80,
                      width:80,
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image:image
                      )
                  ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('$name Official Store',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:0,top: 10,right: 20,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              cubit.changeView(0);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  border: cubit.currentTabViewIndex == 0
                                      ? const Border()
                                      : null,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Products',
                                      style: TextStyle(
                                          color:cubit.currentTabViewIndex==0?HexColor('#07094D'):Colors.black.withOpacity(0.3),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 1,
                                      width: 55,
                                      color:cubit.currentTabViewIndex==0?HexColor('#07094D'):Colors.transparent,
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              cubit.changeView(1);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  border: cubit.currentTabViewIndex == 1
                                      ? const Border()
                                      : null,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Newest',
                                      style: TextStyle(
                                          color:cubit.currentTabViewIndex==1?HexColor('#07094D'):Colors.black.withOpacity(0.3),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 1,
                                      width: 50,
                                      color:cubit.currentTabViewIndex==1?HexColor('#07094D'):Colors.transparent,
                                    )
                                  ],
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              cubit.changeView(2);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  border: cubit.currentTabViewIndex == 2
                                      ? const Border()
                                      : null,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Popular',
                                      style: TextStyle(
                                          color:cubit.currentTabViewIndex==2?HexColor('#07094D'):Colors.black.withOpacity(0.3),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 1,
                                      width: 45,
                                      color:cubit.currentTabViewIndex==2?HexColor('#07094D'):Colors.transparent,
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if(cubit.currentTabViewIndex==0)
                    Container(
                      color: Colors.transparent,
                      child: GridView.count(
                        childAspectRatio: 1 / 1.3,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            cubit.sellersModel!.products!.length,
                                (index) =>
                                buildProductItem(cubit.sellersModel!
                                    .products![index],context)),
                      ),
                    ),
                  if(cubit.filterSellerModel==null)
                    CircularProgressIndicator(),
                  if(cubit.currentTabViewIndex==1)
                    Container(
                      color: Colors.transparent,
                      child: GridView.count(
                        childAspectRatio: 1 / 1.3,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            cubit.filterSellerModel!.newProducts!.length,
                                (index) =>
                                buildProductItem(cubit.filterSellerModel!
                                    .newProducts![index],context)),
                      ),
                    ),
                  if(cubit.filterSellerModel==null)
                    CircularProgressIndicator(),
                  if(cubit.currentTabViewIndex==2)
                    Container(
                      color: Colors.transparent,
                      child: GridView.count(
                        childAspectRatio: 1 / 1.3,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                            cubit.filterSellerModel!.usedProducts!.length,
                                (index) =>
                                buildProductItem(cubit.filterSellerModel!
                                    .usedProducts![index],context)),
                      ),
                    ),
                ],
              ),
            ),
          );
        }
    );
  }
}