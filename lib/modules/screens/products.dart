import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/models/store_model/cate.dart';
import 'package:el_wekala/models/store_model/tap_adv.dart';
import 'package:el_wekala/modules/screens/search.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Products extends StatefulWidget {
  Products({Key? key}) : super(key: key);
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ElWekalaCubit.get(context).getUserData();
  }

  var smoothController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/search.png'),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'El',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Weka',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Text(
                    'la',
                    style: TextStyle(color: Colors.indigo),
                  )
                ],
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: InkWell(
                        onTap: () {
                          cubit.customIndex = 0;
                          navigateTo(context, Search());
                        },
                        child: const Image(
                          image: AssetImage('images/search.png'),
                          color: Colors.black,
                        )))
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: PageView.builder(
                          itemBuilder: (context, index) =>
                              buildAdvicer(tap[index],context),
                          itemCount: tap.length,
                          controller: smoothController,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SmoothPageIndicator(
                          controller: smoothController,
                          count: tap.length,
                          effect: ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 9,
                              dotColor:HexColor('#AFAFAF')
                            // strokeWidth: 5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 90,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildCateItem(cate[index], index, context),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                          itemCount: cate.length,
                        ),
                      ),
                      if(cubit.categoryIndex==0)
                        const Text('Laptop'),
                      if(cubit.categoryIndex==1)
                        const Text('Phone'),
                      if(cubit.categoryIndex==2)
                        const Text('Smart'),
                    ]),
              ),
            ),
          );
        });
  }
}
