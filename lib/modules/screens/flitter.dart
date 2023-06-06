import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/screens/filter_search.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
class FilterSearch extends StatelessWidget {
  const FilterSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
    builder: (context, state){
          var cubit = ElWekalaCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Filter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const Text('All Brands',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Text('Apple'),
                            const Spacer(),
                            Checkbox(value:cubit.apple, onChanged:(value){
                              cubit.checkApple(value);
                            })
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Text('Xiaomi'),
                            Spacer(),
                            Checkbox(value:cubit.xiaomi, onChanged:(value){
                              cubit.checkXiaomi(value);
                            })
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Text('Samsung'),
                            const Spacer(),
                            Checkbox(value:cubit.samsung, onChanged:(value){
                              cubit.checkSamsung(value);
                            })
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Text('Huawei'),
                            Spacer(),
                            Checkbox(value:cubit.huawei, onChanged:(value){
                              cubit.checkHuawei(value);
                            })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('All Categories',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Text('Laptops'),
                            const Spacer(),
                            Checkbox(value:cubit.lap, onChanged:(value){
                              cubit.checkLap(value);
                            })
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Text('Smart Phones'),
                            const Spacer(),
                            Checkbox(value:cubit.smartphone, onChanged:(value){
                              cubit.checkPhone(value);
                            })
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Text('Smart Watches'),
                            const Spacer(),
                            Checkbox(value:cubit.smartWatches, onChanged:(value){
                              cubit.checkWatch(value);
                            })
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Text('Smart Tvs'),
                            const Spacer(),
                            Checkbox(value:cubit.smartTvs, onChanged:(value){
                              cubit.checkTv(value);
                            })
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children:[
                            const Text('Accessories'),
                            const Spacer(),
                            Checkbox(value:cubit.acc, onChanged:(value){
                              cubit.checkAcc(value);
                            })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 5.0,right: 5.0,bottom: 5.0),
                child: DefaultButton(buttonWidget:const Text('Apply',style: TextStyle(color: Colors.white),), function:(){
                  cubit.getFilter();
                  navigateTo(context,FilterSearchProducts());
                },
                  backgroundColor: HexColor('#07094D'),
                  borderColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
    },
    );
  }
}
