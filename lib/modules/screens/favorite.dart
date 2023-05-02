import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/build_favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ElWekalaCubit.get(context).getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          if(cubit.favoriteModel!.favoriteProducts!.isEmpty){
            return Scaffold(
                backgroundColor: Colors.grey[200],
                appBar: AppBar(
                  backgroundColor: Colors.grey[200],
                  title: const Text('Favorite'),
                  centerTitle: true,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: InkWell(
                        onTap: (){},
                        child: SvgPicture.asset('images/setting_icon.svg')),
                  ),
                ),
                body:const Center(
                  child: Text('Favorite is Empty'),
                )
            );
          }else {
            return Scaffold(
                backgroundColor: Colors.grey[200],
                appBar: AppBar(
                  backgroundColor: Colors.grey[200],
                  title: const Text('Favorite'),
                  centerTitle: true,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: InkWell(
                        onTap: () {},
                        child: SvgPicture.asset('images/setting_icon.svg')),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    color: Colors.transparent,
                    child: GridView.count(
                      childAspectRatio: 1 / 1.3,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                          cubit.favoriteModel!.favoriteProducts!.length,
                              (index) =>
                              buildFavoriteItem(cubit.favoriteModel!
                                  .favoriteProducts![index],context)),
                    ),
                  ),
                ));
          }
        });
  }
}
