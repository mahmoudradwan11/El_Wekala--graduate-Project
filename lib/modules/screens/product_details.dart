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
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SvgPicture.asset(
                    'images/setting_icon.svg',
                    height: 10,
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )),
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
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                cubit.changeView(0);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: cubit.currentTabViewIndex == 0
                                      ? Border()
                                      : null,
                                ),
                                child: Text(
                                  'Overview',
                                  style: TextStyle(
                                  color: HexColor('#07094D'),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                                ),
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
                                        ? Border()
                                        : null,
                                  ),
                                  child: Text(
                                    'Specification',
                                    style: TextStyle(
                                        color: HexColor('#07094D'),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
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
                                        ? Border()
                                        : null,
                                  ),
                                  child: Text(
                                    'Review',
                                    style: TextStyle(
                                        color: HexColor('#07094D'),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (cubit.currentTabViewIndex == 0)
                      Padding(
                        padding: const EdgeInsets.only(left:20.0, top: 5),
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
                                    children:[
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
                  ]),
            ),
          );
        });
  }
}
