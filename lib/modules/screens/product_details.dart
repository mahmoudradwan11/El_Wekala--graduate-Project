import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key,this.model}) : super(key: key);
  var model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
    builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
             leading: InkWell(
               onTap:(){
                 Navigator.pop(context);
               },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: SvgPicture.asset('images/setting_icon.svg',height: 10,),
                 )
             ),
            ),
              body:SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Row(
                        children:[
                          Expanded(child: Text(model.name)),
                          Container(
                            decoration: BoxDecoration(
                              color: HexColor('#E6E7E8'),
                              borderRadius: BorderRadius.circular(6)
                            ),
                            height: 30,
                              width: 30,
                              child:const Center(child: Icon(Icons.favorite,color: Colors.red,)))
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      height: 180,
                      child:Image(
                        image: NetworkImage(model.imageLink),
                      ),
                    )
                  ],
                ),
              ),

          );
    }
    );
  }
}
