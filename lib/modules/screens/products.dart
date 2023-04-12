import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/core/themes/Icon_Borken.dart';
import 'package:el_wekala/modules/screens/search.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products extends StatelessWidget {
  Products({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
         var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading:const Padding(
                padding:  EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/search.png'),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const[
                  Text('El',style: TextStyle(color: Colors.red,),),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Weka',style: TextStyle(color: Colors.black),),
                  SizedBox(width: 1,),
                  Text('la',style: TextStyle(color: Colors.indigo),)
                ],
              ),
              actions:[
                Padding(
                    padding:const EdgeInsets.only(left: 20.0,right: 20),
                    child: InkWell(
                      onTap:(){
                        cubit.customIndex = 0;
                        navigateTo(context,Search());
                      },
                        child:const Image(image: AssetImage('images/search.png'),color: Colors.black,))
                )
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Text('Product')
                ],
              ),
            ),
          );
        });
  }
}
