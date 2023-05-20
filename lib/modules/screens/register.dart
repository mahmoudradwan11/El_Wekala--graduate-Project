import 'package:el_wekala/core/controllers/register_cubit/register_cubit.dart';
import 'package:el_wekala/core/controllers/register_cubit/register_states.dart';
import 'package:el_wekala/core/network/constants.dart';
import 'package:el_wekala/core/network/local/cache_helper.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/builders/defaultFieldForm.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:el_wekala/modules/widgets/functions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home.dart';
import 'login.dart';
class Register extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nationalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.loginModel.status=="success") {
              print(state.loginModel.message);
              showToast(state.loginModel.message!, ToastStates.SUCCESS);
              print(state.loginModel.user!.token);
              CacheHelper.saveData(key: 'userId', value: state.loginModel.user!.nationalId).then((value){
                nationalId = state.loginModel.user!.nationalId;
              });
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.user!.token,
              ).then((value) {
                token = state.loginModel.user!.token!;
                navigateAndFinish(
                  context,
                  const Home(),
                );
              });
            } else {
              print(state.loginModel.message);
            }
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        const Text(
                          'Lets Get Started',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Sign Up and we will continue'),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(onPressed:(){
                          cubit.addImage();
                        },child: const Text('Selected Image'),),
                        Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(FontAwesomeIcons.apple),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50,right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 1,
                                width: 100,
                                color: Colors.black,
                              ),
                              Text('Or',style: TextStyle(fontWeight: FontWeight.w600),),
                              Container(
                                height: 1,
                                width: 100,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text('UserName',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFieldForm(
                            controller: nameController,
                            keyboard: TextInputType.text,
                            valid: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your name';
                              }
                              return null;
                            },
                            prefix: Icons.person,
                            hint: 'Full Name',
                            hintStyle: const TextStyle(color: Colors.grey),
                            show: false),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text('Phone',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFieldForm(
                            controller: phoneController,
                            keyboard: TextInputType.phone,
                            valid: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your phone';
                              }
                              return null;
                            },
                            prefix: Icons.phone,
                            hint: 'phone',
                            hintStyle: const TextStyle(color: Colors.grey),
                            show: false),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text('Email',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFieldForm(
                            controller: emailController,
                            keyboard: TextInputType.emailAddress,
                            valid: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your Email';
                              }
                              return null;
                            },
                            prefix: Icons.email,
                            hint: 'Email',
                            hintStyle: const TextStyle(color: Colors.grey),
                            show: false),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text('Password',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFieldForm(
                            controller: passwordController,
                            keyboard: TextInputType.emailAddress,
                            valid: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your password';
                              }
                              return null;
                            },
                            prefix: Icons.lock,
                            hint: 'password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            show: cubit.isPassword,
                            suffix: cubit.suffix,
                            suffixPress: () {
                              cubit.changePasswordVisibility();
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text('National ID',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFieldForm(
                            controller: nationalController,
                            keyboard: TextInputType.number,
                            valid: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your Email';
                              }
                              return null;
                            },
                            prefix: Icons.email,
                            hint: 'national Id',
                            hintStyle: const TextStyle(color: Colors.grey),
                            show: false),
                        const SizedBox(
                          height: 40,
                        ),
                        DefaultButton(
                          backgroundColor:HexColor('#07094D'),
                          buttonWidget: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userRegister(
                                  email: emailController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                  nationalId: nationalController.text,
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 10),
                          child: Row(
                            children: [
                              Text('Already have an account?'),
                              MaterialButton(onPressed:(){
                                navigateTo(context, Login());
                              },child: Text('Sign In',style: TextStyle(color: HexColor('#07094D'),),))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}