import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:const Text('Cart'),
            ),
            body:const Center(
              child: Text(
                  'Cart'
              ),
            ),
          );
        }
    );
  }
}
