import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/screens/search.dart';
import 'package:el_wekala/modules/widgets/builders/cateogy_screen_item.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Cateogry extends StatelessWidget {
  Cateogry({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]
                  ),
                  height: 10,
                  width: 5,
                  child: Center(
                    child: IconButton(
                      onPressed:(){
                      },
                      icon:const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.grey[200],
              title:const Text('Cateogry'),
            ),
            body:Column(
              children: [
                InkWell(
                  onTap: (){
                    cubit.customIndex = 1;
                    navigateTo(context,Search());
                  },
                    child: buildCategoryScreenItem('News Products')),
                InkWell(
                  onTap:(){
                    cubit.customIndex = 2;
                    navigateTo(context,Search());
                  },
                    child: buildCategoryScreenItem('Used Products'))
              ],
              ),
          );
        }
    );
  }
}
