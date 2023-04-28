import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/screens/search.dart';
import 'package:el_wekala/modules/widgets/builders/cateogy_screen_item.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NewsProducts extends StatelessWidget {
  const NewsProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
    builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 7),
                child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('images/setting_icon.svg')),
              ),
                backgroundColor: Colors.grey[200],
                title:const Text('New Products'),
              centerTitle: true,
            ),
            body:Column(
              children: [
                InkWell(
                    onTap: (){
                      cubit.customIndex = 1;
                      navigateTo(context,Search());
                    },
                    child: buildCategoryScreenItem('LapTop')),
                InkWell(
                    onTap:(){
                      cubit.customIndex = 1;
                      navigateTo(context,Search());
                    },
                    child: buildCategoryScreenItem('Smart Phones')),
                InkWell(
                    onTap:(){
                      cubit.customIndex = 1;
                      navigateTo(context,Search());
                    },
                    child: buildCategoryScreenItem('Smart Watches'))
              ],
            ),

          );
    }
    );
  }
}