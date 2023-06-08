import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/screens/home.dart';
import 'package:el_wekala/modules/screens/payment_basic.dart';
import 'package:el_wekala/modules/widgets/builders/build_cart_Item.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
           var cubit = ElWekalaCubit.get(context);
           if(cubit.cartModel==null){
             return Center(child:LoadingAnimationWidget.inkDrop(
               color: Colors.black,
               size: 20,
             ),
             );
           }
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              backgroundColor: Colors.grey[200],
              title:const Text('Cart'),
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 7),
                child: InkWell(
                    onTap: (){
                      navigateTo(context, Home());
                      cubit.currentIndex=0;
                    },
                    child: SvgPicture.asset('images/setting_icon.svg')),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child:SingleChildScrollView(
                child: Column(
                  children:[
                    if(cubit.cartModel!.products!.isNotEmpty)
                     ListView.separated(
                      shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder:(context,index)=>buildCartItem(cubit.cartModel!.products![index],context),
                        separatorBuilder:(context,index)=>const SizedBox(
                          height: 30,
                        ),
                        itemCount:cubit.cartModel!.products!.length
                    ),
                    if(cubit.cartModel!.products!.isEmpty)
                      const Center(
                        child: Text('Cart Is Empty'),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: HexColor('#FEFEFE'),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      width: double.infinity,
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children:[
                            const Text('Apply coppen code .....'),
                            const Spacer(),
                            DefaultButton(
                              height: 40,
                             backgroundColor: HexColor('#07094D'),
                              width: 93,
                                buttonWidget:const Text('Apply',style: TextStyle(color: Colors.white),), function:(){}),
                          ],
                        ),
                      )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(20)
                      ),
                      width: double.infinity,
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 33,
                              child: Row(
                                children: [
                                  const Text('Sub Total'),
                                  const Spacer(),
                                  Text('\$${cubit.totalCart!.totalPrice}',style: TextStyle(
                                      color: HexColor('#07094D'),
                            fontWeight: FontWeight.w600,
                            fontSize: 15
                        ),)
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[300],
                              width: double.infinity,
                            ),
                            Container(
                              height: 32,
                              child: Row(
                                children: [
                                  const Text('Shiping'),
                                  const Spacer(),
                                  Text('\$10',style: TextStyle(
                                      color: HexColor('#07094D'),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15
                                  ),
                            )
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[300],
                              width: double.infinity,
                            ),
                            Container(
                              height: 33,
                              child: Row(
                                children: [
                                  Text('Total'),
                                  Spacer(),
                                  Text('\$${cubit.totalCart!.totalPrice+10.0}',style: TextStyle(
                                    color: HexColor('#07094D'),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15
                                  ),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(colors:[
                          HexColor('#07094D'),
                          HexColor('#7F3BA8'),
                        ]
                        )
                      ),
                      child:Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('data',style: TextStyle(color: Colors.transparent),),
                          InkWell(
                              onTap:(){
                                navigateTo(context,PaymentBasic(price:cubit.totalCart!.totalPrice.round()+10,));
                              },
                              child: const Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),)),
                          Container(
                            decoration: BoxDecoration(
                                color: HexColor('#07094D'),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            height:50,
                            width:50,
                            child:const Icon(Icons.shopping_cart,color: Colors.white,),
                          )
                        ],
                      )
                    )
                  ],
                ),
              )
            ),
          );
        }
    );
  }
}