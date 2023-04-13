import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/custom_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('images/setting_icon.svg'))
              ),
              centerTitle: true,
              title:const Text('Popular Product'),
            ),
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  height: 60,
                  child: Center(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding:const EdgeInsets.all(20),
                          border: InputBorder.none,
                          hintText: 'Search in Products',
                          suffixIcon:Image(image:AssetImage('images/search.png'),color:HexColor('#000000'),)
                      ),
                      /*
                      onSubmitted: (value) {
                        cubit.search(value);
                        navigateTo(context, const SearchScreen());

                       */
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35,
                  child: Row(
                    children: [
                      ListView.separated(
                          shrinkWrap:true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder:(context,index)=>BuildCustomTapBar(cubit.customTap[index],index,context),
                          separatorBuilder:(context,index)=>const SizedBox(
                            width: 10,
                          ),
                          itemCount:cubit.customTap.length,
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        height: 63,
                        width: 112,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            items: ["SortBy", "Used", "Company", "Price"]
                                .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                                .toList(),
                            onChanged: (value) {
                             cubit.selectedSort(value);
                            },
                            value: cubit.sortSelected
                          ),
                        ),
                        //color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
              ),
              if(cubit.customIndex==0)
              const Text('All',style: TextStyle(fontSize: 50,color: Colors.indigo),),
              if(cubit.customIndex==1)
                const Text('News',style: TextStyle(fontSize: 50,color: Colors.indigo),),
              if(cubit.customIndex==2)
                const Text('Used',style: TextStyle(fontSize: 50,color: Colors.indigo),)
            ],
          ),
            ),
          );
        }
    );
  }
}