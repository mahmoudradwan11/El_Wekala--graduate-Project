import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/build_cart_Item.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              backgroundColor: Colors.grey[200],
              title:const Text('Cart'),
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 7),
                child: InkWell(
                    onTap: (){},
                    child: SvgPicture.asset('images/setting_icon.svg')),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child:SingleChildScrollView(
                child: Column(
                  children:[
                    ListView.separated(
                      shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder:(context,index)=>buildCartItem(),
                        separatorBuilder:(context,index)=>const SizedBox(
                          height: 30,
                        ),
                        itemCount:2),
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
                            Text('Apply coppen code .....'),
                            Spacer(),
                            DefaultButton(
                              height: 40,
                             backgroundColor: HexColor('#07094D'),
                              width: 93,
                                buttonWidget:Text('Apply',style: TextStyle(color: Colors.white),), function:(){})
                          ],
                        ),
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