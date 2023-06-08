import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/builders/text_g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ContactUs extends StatelessWidget {
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ContactUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state){
          var cubit = ElWekalaCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:const Text('Report',),
            ),
            body:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    buildTextForm(
                      context,
                      buttonController: descriptionController,
                      title: 'Problem',
                      MediaQuery.of(context).size.height * 0.22,
                    ),
                    const Spacer(),
                    DefaultButton(function:(){
                      cubit.sendReport(descriptionController.text,context);
                     // showToast('Send',ToastStates.SUCCESS);
                    },
                      borderColor: Colors.white,
                      backgroundColor:HexColor('#07094D'),
                      buttonWidget: const Text(
                        'Send',style: TextStyle(
                          color: Colors.white
                      ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}