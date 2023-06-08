import 'package:el_wekala/core/controllers/register_cubit/register_cubit.dart';
import 'package:el_wekala/core/controllers/register_cubit/register_states.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
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
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'home.dart';
import 'login.dart';
class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nationalController = TextEditingController();
  bool check = false;
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
                ElWekalaCubit.get(context).currentIndex=0;
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
                        const Text('Sign Up and we will continue',),
                        const SizedBox(
                          height: 20,
                        ),
                        cubit.image==null? MaterialButton(onPressed:(){
                          cubit.addImage();
                        },child: Icon(Icons.add_photo_alternate)):CircleAvatar(
                          radius:50,
                          child: ClipOval(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(cubit.image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                              const Text('Or',style: TextStyle(fontWeight: FontWeight.w600),),
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
                            child: Text('FullName',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('#F2F2F2'),
                          ),
                          child: DefaultFieldForm(
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text('Phone',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('#F2F2F2'),
                          ),
                          child: DefaultFieldForm(
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text('Email',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
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
                            child: Text('Password',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
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
                              show: cubit.isPassword,
                              suffix: cubit.suffix,
                              suffixPress: () {
                                cubit.changePasswordVisibility();
                              }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text('National ID',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
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
                              keyboard: TextInputType.number,
                              valid: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your National';
                                }
                                return null;
                              },
                              prefix: Icons.email,
                              hint: 'national Id',
                              hintStyle: const TextStyle(color: Colors.grey),
                              show: false),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children:[
                            Expanded(
                              child: InkWell(
                                onTap:(){
                                  cubit.changeToMale();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:cubit.isMale?HexColor('#07094D'):Colors.grey[400],
                                  ),
                                  height: 53,
                                  width: 160,
                                  child: const Center(child:  Text('Male',style: TextStyle(color: Colors.white),)),),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap:(){
                                  cubit.changeToFemale();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:cubit.isMale?Colors.grey[400]:HexColor('#07094D'),
                                  ),
                                  height: 53,
                                  width: 160,
                                  child:const Center(child: Text('Female',style: TextStyle(color: Colors.white),)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: HexColor('#07094D'),
                                  value:check, onChanged:(value){
                                setState(() {
                                  check = value!;
                                });
                              }),
                              Expanded(child: Column(
                                children:const [
                                  SizedBox(height: 12,),
                                  Text('I Have read and agree to the privacy policy, terms of serice, and community guidelines.',style: TextStyle(color: Colors.black,fontSize:12,fontWeight: FontWeight.w500),),
                                ],
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        if (state is RegisterLoadingState) const SizedBox(height: 10),
                        state is RegisterLoadingState? LoadingAnimationWidget.inkDrop(
                          color: Colors.black,
                          size: 20,
                        ):
                        DefaultButton(
                          backgroundColor:HexColor('#07094D'),
                          borderColor: Colors.transparent,
                          buttonWidget: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                          function: () {
                            if (formKey.currentState!.validate() && check == true){
                              cubit.userRegister(
                                  email: emailController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                  nationalId: nationalController.text,
                              );
                            }
                            if(check==false)
                              {
                                showToast('Please Confirm policy', ToastStates.WARNING);
                              }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 10),
                          child: Row(
                            children:[
                              const Text('Already have an account?'),
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
