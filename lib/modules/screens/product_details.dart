import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/screens/sellers.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            InkWell(
                              onTap:(){
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'images/setting_icon.svg',
                                height: 31,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 31,
                              width: 80,
                              decoration: BoxDecoration(
                                color: HexColor('#E6E7E8'),
                                borderRadius: BorderRadius.circular(6)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex:2,
                                        child: Text('Chat',style: TextStyle(color: HexColor('#07094D'),fontWeight: FontWeight.w600),)),
                                    Expanded(child: Icon(Icons.chat,color:HexColor('#07094D')))
                                  ],
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              model.name,
                              style:const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )),
                            InkWell(
                              onTap:(){
                                cubit.addtoMyFavorite(model.sId);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: HexColor('#E6E7E8'),
                                      borderRadius: BorderRadius.circular(6)),
                                  height: 30,
                                  width: 30,
                                  child: const Center(
                                      child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ))),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      height: 300,
                      child: Image(
                        fit: BoxFit.contain,
                        image: NetworkImage(model.image),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                      child: Row(
                        children: [
                          Text(
                            '\$${model.price.round()}',
                            style: TextStyle(
                                color: HexColor('#07094D'),
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          const Text(
                            '  (Inclusive of VAT)',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 9),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: HexColor('#07094D'),
                              ),
                              Icon(
                                Icons.star,
                                color: HexColor('#07094D'),
                              ),
                              Icon(
                                Icons.star,
                                color: HexColor('#07094D'),
                              ),
                              Icon(
                                Icons.star,
                                color: HexColor('#07094D'),
                              ),
                              Icon(
                                Icons.star,
                                color: HexColor('#07094D'),
                              ),
                              Text('5.0',
                                  style: TextStyle(color: HexColor('#07094D'))),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                      child: Text(
                        'Number in Stock : ${model.countInStock}',
                        style: TextStyle(
                            color: HexColor('#FF0000'),
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Free Delivery by Mon, 10 April',
                            style: TextStyle(
                                color: HexColor('#07094D'),
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                          Text(
                            'Order in 4h 21m',
                            style: TextStyle(
                                color: HexColor('#07094D'),
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(color: HexColor('#E3E3E3'),borderRadius: BorderRadius.circular(6)),
                        child:Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Container(
                                      height:50,
                                      width:50,
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      image:cubit.chooseImageCompany(model.company!),)
                                    )
                                  ),
                                  SizedBox(width: 20,),
                                  InkWell(
                                    onTap:(){
                                      cubit.getSellerProducts(model.company!);
                                      cubit.getFilterSellerProducts(model.company);
                                      navigateTo(context,SellersScreen(name: model.company,image: cubit.companyImage,));
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${model.company} Official Store',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                        SizedBox(height: 5,),
                                        Text('View store',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Colors.grey[500]),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 30,top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:[
                                  const Text('Product as Described',style: TextStyle(fontWeight: FontWeight.w600,fontSize:12,),),
                                  LinearPercentIndicator(
                                    width: 140.0,
                                    lineHeight: 4,
                                    percent: (model.countInStock*0.0100),
                                    backgroundColor:HexColor('#D9D9D9'),
                                    progressColor: HexColor('#00AC07'),
                                  ),
                                  Text('${model.countInStock*10}%',style: TextStyle(fontWeight: FontWeight.w600,fontSize:10,color:HexColor('#00AC07'),),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
                                      'Overview',
                                      style: TextStyle(
                                          color:cubit.currentTabViewIndex==0?Colors.black:Colors.black.withOpacity(0.3),
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
                                        'Specification',
                                        style: TextStyle(
                                            color:cubit.currentTabViewIndex==1?Colors.black:Colors.black.withOpacity(0.3),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 1,
                                        width: 80,
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
                                        'Review',
                                        style: TextStyle(
                                            color:cubit.currentTabViewIndex==2?Colors.black:Colors.black.withOpacity(0.3),
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
                    if (cubit.currentTabViewIndex == 0)
                      Padding(
                        padding: const EdgeInsets.only(left:20.0, top: 5,right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Highlights',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model.description,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    if (cubit.currentTabViewIndex == 1)
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            const Text(
                              'Specification',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600,),
                            ),
                             const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2,right:20,top: 10),
                              child: Container(
                                height:32,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: HexColor('#9B9CB7').withOpacity(0.36),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,
                                  right: 100),
                                  child: Row(
                                    children:const [
                                      Text('Color Name',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                      Spacer(),
                                      Text('Black',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2,right:20),
                              child: Container(
                                height:32,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: HexColor('#FEFEFE').withOpacity(0.36),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,
                                      right: 100),
                                  child: Row(
                                    children:const [
                                      Text('Country',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                      Spacer(),
                                      Text('USA',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2,right:20),
                              child: Container(
                                height:32,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: HexColor('#9B9CB7').withOpacity(0.36),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,
                                      right: 100),
                                  child: Row(
                                    children:const [
                                      Text('Graphics Memory',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                      Spacer(),
                                      Text('8 GB',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2,right:20),
                              child: Container(
                                height:32,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: HexColor('#FEFEFE').withOpacity(0.36),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20,
                                      right: 100),
                                  child: Row(
                                    children:const [
                                      Text('Display Resolution Type',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                                      Spacer(),
                                      Text('QHD',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            height: 42,
                            width: 52,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color:HexColor('#07094D'),),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Column(
                              children: [
                                Text('QTY',style: TextStyle(color:HexColor('#07094D'),fontWeight: FontWeight.w600),),
                                Text('1',style: TextStyle(color:HexColor('#07094D'),fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child:
                          DefaultButton(buttonWidget: Text('Add to Cart',style: TextStyle(color: Colors.white),),function:(){
                            cubit.addToMyCart(model.sId);
                          },radius: 11,backgroundColor: HexColor('#07094D'),borderColor: Colors.transparent,))
                        ],
                      ),
                    )
                  ]),
            ),
          );
        });
  }
}
