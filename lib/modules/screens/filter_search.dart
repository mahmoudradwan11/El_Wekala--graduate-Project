import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/build_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
class FilterSearchProducts extends StatelessWidget {
  FilterSearchProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            appBar:AppBar(
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
                title:const Text('Filter Product'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            cubit.filterProducts!.products!.length,
                                (index) =>
                                buildProductItem(cubit.filterProducts!
                                    .products![index],context)),
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