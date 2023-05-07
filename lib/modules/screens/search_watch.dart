import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/build_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchWatch extends StatelessWidget {
  SearchWatch({Key? key}) : super(key: key);
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
                              hintText: 'Search in Watches',
                              suffixIcon:Image(image:const AssetImage('images/search.png'),color:HexColor('#000000'),)
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
                          cubit.homeSmartWatch!.product!.length,
                              (index) =>
                              buildProductItem(cubit.homeSmartWatch!
                                  .product![index],context)),
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