import 'package:el_wekala/core/controllers/login_cubit/login_cubit.dart';
import 'package:el_wekala/core/controllers/login_cubit/login_states.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/builders/defaultFieldForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
class ForgetMyPassword extends StatelessWidget {
  ForgetMyPassword({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var nationalController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(title:const Text('Change Your Password'),),
            body: Center(
              child: Form(
                key:formKey,
                child: Column(
                  children: [
                    const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text('NationalID',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('#F2F2F2'),
                      ),
                      child: DefaultFieldForm(
                          controller: nationalController,
                          keyboard: TextInputType.emailAddress,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your national';
                            }
                            return null;
                          },
                          prefix: Icons.person,
                          hint: 'National',
                          hintStyle: const TextStyle(color: Colors.grey),
                          show: false),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text('New Password',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('#F2F2F2'),
                      ),
                      child: DefaultFieldForm(
                          controller: passwordController,
                          keyboard: TextInputType.visiblePassword,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter New password';
                            }
                            return null;
                          },
                          prefix: Icons.lock,
                          hint: 'password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          show: cubit.passwordShow,
                          suffix: cubit.suffixIcon,
                          suffixPress: () {
                            cubit.changePasswordIcon();
                          }),
                    ),
                    Spacer(),
                    DefaultButton(buttonWidget:const Text('Change',style: TextStyle(color: Colors.white),), function:(){
                      if (formKey.currentState!.validate()) {
                        cubit.forgetPassword(
                            passwordController.text,
                            nationalController.text
                        );
                      }
                    },backgroundColor:HexColor('#07094D'
                    ),)
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
