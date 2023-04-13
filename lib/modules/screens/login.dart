import 'package:el_wekala/core/controllers/login_cubit/login_cubit.dart';
import 'package:el_wekala/core/controllers/login_cubit/login_states.dart';
import 'package:el_wekala/core/network/constants.dart';
import 'package:el_wekala/core/network/local/cache_helper.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/builders/defaultFieldForm.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:el_wekala/modules/widgets/functions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'home.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.model.status=="success") {
            print(state.model.message);
            print(state.model.user!.token);
            CacheHelper.saveData(key: 'token', value: state.model.user!.token)
                .then((value) {
              token = state.model.user!.token;
              showToast('${state.model.message}', ToastStates.SUCCESS);
              navigateAndFinish(context, const Home());
            });
          } else {
            print(state.model.message);
          }
        }
      }, builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Scaffold(
          //backgroundColor: Colors.green,
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
                        'Sign In',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('sign in with '),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FaIcon(
                              FontAwesomeIcons.twitter,
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
                      const Text('or'),
                      const SizedBox(
                        height: 20,
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
                          show: cubit.passwordShow,
                          suffix: cubit.suffixIcon,
                          suffixPress: () {
                            cubit.changePasswordIcon();
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      if (state is LoadingLogin) const SizedBox(height: 10),
                      state is LoadingLogin? LoadingAnimationWidget.inkDrop(
                        color: Colors.black,
                        size: 20,
                      ):
                      DefaultButton(
                        backgroundColor: Colors.black,
                        buttonWidget: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                        function: () {
                          if (formKey.currentState!.validate()) {
                            cubit.loginUser(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultButton(
                        backgroundColor: Colors.white,
                        buttonWidget: const Text(
                          'create Account ',
                          style: TextStyle(color: Colors.black),
                        ),
                        function: () {
                          //navigateTo(context, Register());
                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
