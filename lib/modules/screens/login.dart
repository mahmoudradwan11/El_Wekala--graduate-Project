import 'package:el_wekala/core/controllers/login_cubit/login_cubit.dart';
import 'package:el_wekala/core/controllers/login_cubit/login_states.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/network/constants.dart';
import 'package:el_wekala/core/network/local/cache_helper.dart';
import 'package:el_wekala/modules/screens/forgetpassword.dart';
import 'package:el_wekala/modules/screens/register.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/builders/defaultFieldForm.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:el_wekala/modules/widgets/functions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'home.dart';
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccessState) {
        if (state.model.status == "success") {
          print(state.model.message);
          print(state.model.user!.token);
          CacheHelper.saveData(
              key: 'userId', value: state.model.user!.nationalId).then((value) {
            nationalId = state.model.user!.nationalId;
          });
          CacheHelper.saveData(key: 'token', value: state.model.user!.token)
              .then((value) {
            token = state.model.user!.token;
            showToast('${state.model.message}', ToastStates.SUCCESS);
            ElWekalaCubit.get(context).currentIndex=0;
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
                    const SizedBox(height: 80),
                    const Text(
                      'Welcome!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Please enter your data to continue',
                      style: TextStyle(color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),),
                    const SizedBox(
                      height: 70,
                    ),
                    const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'UserEmail', style: TextStyle(fontWeight: FontWeight
                            .w600, fontSize: 15),)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('#F2F2F2'),
                      ),
                      child: DefaultFieldForm(
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Password', style: TextStyle(fontWeight: FontWeight
                            .w600, fontSize: 15),)),
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
                    ),
                    Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: MaterialButton(onPressed: () {
                          navigateTo(context, ForgetMyPassword());
                        }, child: const Text('Forget My Password ?'),)),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 1,
                            width: 100,
                            color: Colors.black,
                          ),
                          const Text('Or',
                            style: TextStyle(fontWeight: FontWeight.w600),),
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
                    Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.google,
                            color: HexColor('#07094D'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const FaIcon(FontAwesomeIcons.apple),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    if (state is LoadingLogin) const SizedBox(height: 10),
                    state is LoadingLogin ? LoadingAnimationWidget.inkDrop(
                      color: Colors.black,
                      size: 20,
                    ) :
                    DefaultButton(
                      backgroundColor: HexColor('#07094D'),
                      buttonWidget: const Text(
                        'Login',
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

                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Row(
                        children:[
                          const Text('I don\'t Have account?'),
                          MaterialButton(onPressed: () {
                            navigateTo(context, Register());
                          },
                              child: Text('Create Account',
                                style: TextStyle(color: HexColor('#07094D'),),))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    }
    );
  }
}
