import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          // var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:const Text('Favorite'),
            ),
            body:const Center(
              child: Text(
                  'Favorite'
              ),
            ),
          );
        }
    );
  }
}
