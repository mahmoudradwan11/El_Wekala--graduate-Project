import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/screens/search_lap.dart';
import 'package:el_wekala/modules/screens/search_phone.dart';
import 'package:el_wekala/modules/widgets/builders/cateogy_screen_item.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class UsedProducts extends StatelessWidget {
  const UsedProducts({Key? key}) : super(key: key);

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
              title:const Text('Used Products'),
              centerTitle: true,
            ),
            body:Column(
              children: [
                InkWell(
                    onTap: (){
                      cubit.customIndex = 2;
                      navigateTo(context,SearchLap());
                    },
                    child: buildCategoryScreenItem('LapTop',cubit.homeLaptops!.usedProduct!.length)),
                InkWell(
                    onTap:(){
                      cubit.customIndex = 2;
                      navigateTo(context,SearchPhone());
                    },
                    child: buildCategoryScreenItem('Smart Phones',cubit.homeSmartPhone!.usedProduct!.length)),
              ],
            ),

          );
        }
    );
  }
}
