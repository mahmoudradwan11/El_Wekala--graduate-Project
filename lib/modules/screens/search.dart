import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/core/themes/Icon_Borken.dart';
import 'package:el_wekala/modules/screens/cart.dart';
import 'package:el_wekala/modules/screens/flitter.dart';
import 'package:el_wekala/modules/widgets/builders/build_product_item.dart';
import 'package:el_wekala/modules/widgets/builders/custom_tap.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:badges/badges.dart' as badges;
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
                      cubit.searchProduct(keyword: '');
                    },
                    child: SvgPicture.asset('images/setting_icon.svg'))
              ),
              centerTitle: true,
              title:const Text('Popular Product'),
               actions:[
                 Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                      onPressed: () {
                        navigateTo(context,Cart());
                      },
                      icon: badges.Badge(
                        badgeAnimation: const badges.BadgeAnimation.slide(
                          animationDuration: Duration(seconds: 1),
                          colorChangeAnimationDuration: Duration(seconds: 1),
                          loopAnimation: false,
                          curve: Curves.fastOutSlowIn,
                          colorChangeAnimationCurve: Curves.easeInCubic,
                        ),
                        position:
                        badges.BadgePosition.topEnd(top: -15, end: -12),
                        badgeStyle: badges.BadgeStyle(
                          padding: const EdgeInsets.all(3),
                          borderRadius: BorderRadius.circular(4),
                          badgeColor: Colors.red,
                        ),
                        badgeContent: Text(
                          '${cubit.cartModel!.products!.length}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        child:
                         Icon(IconBroken.Bag_2,color: HexColor('#07094D'),),
                      )),
                )
          ]
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
                      onChanged:(value){
                        cubit.searchProduct(keyword: value);
                      },
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
                          itemBuilder:(context,index)=>buildCustomTapBar(cubit.customTap[index],index,context),
                          separatorBuilder:(context,index)=>const SizedBox(
                            width: 10,
                          ),
                          itemCount:cubit.customTap.length,
                      ),
                      Spacer(),
                      IconButton(onPressed:(){
                        navigateTo(context,const FilterSearch());
                      }, icon:const Icon(Icons.filter_list)),
                      Container(
                        height: 50,
                        width:110,
                        child: DropdownButton(
                          items: ["Recent", "Top", "Price","Companies"]
                              .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          )).toList(),
                          onChanged: (value) {
                            cubit.selectedSort(value,context);
                          },
                          value:cubit.sortSelected
                        ),
                        //color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
              ),
              if(cubit.customIndex==0)
              cubit.searchModel!.products!.isEmpty?const Text('All'):Container(
                color: Colors.transparent,
                child: GridView.count(
                  childAspectRatio: 1 / 1.3,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(
                      cubit.searchModel!.products!.length,
                          (index) =>
                          buildProductItem(cubit.searchModel!
                              .products![index],context)),
                ),
              ),
              if(cubit.customIndex==1)
                Container(
                  color: Colors.transparent,
                  child: GridView.count(
                    childAspectRatio: 1 / 1.3,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(
                        cubit.searchFilterModel!.newProducts!.length,
                            (index) =>
                            buildProductItem(cubit.searchFilterModel!
                                .newProducts![index],context)),
                  ),
                ),
              if(cubit.customIndex==2)
                Container(
                  color: Colors.transparent,
                  child: GridView.count(
                    childAspectRatio: 1 / 1.3,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(
                        cubit.searchFilterModel!.usedProducts!.length,
                            (index) =>
                            buildProductItem(cubit.searchFilterModel!
                                .usedProducts![index],context)),
                  ),
                ),
            ],
          ),
            ),
          );
        }
    );
  }
}