import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/builders/defaultFieldForm.dart';
import 'package:el_wekala/modules/widgets/functions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElWekalaCubit, ElWekalaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElWekalaCubit.get(context);
          var nameController = TextEditingController();
          var emailController = TextEditingController();
          var phoneController = TextEditingController();
          var model = cubit.profileModel;
          nameController.text = model!.user!.name!;
          emailController.text = model.user!.email!;
          phoneController.text = model.user!.phone!;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 275,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        const Image(image: AssetImage('images/edit.png')),
                         Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: CircleAvatar(
                            radius: 68,
                            backgroundImage: NetworkImage(cubit.profileModel!.user!.profileImage!)
                          ),
                        ),
                        const Positioned(
                            top: 50,
                            left: 80,
                            child: Text(
                              'Profile Setting',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Jannah',
                                  fontSize: 20),
                            )),
                        const Positioned(
                            top: 50,
                            right: 30,
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Jannah',
                                  fontSize: 20),
                            )),
                        Positioned(
                            top: 55,
                            left: 30,
                            child: InkWell(
                              onTap:(){
                                Navigator.pop(context);
                              },
                                child: SvgPicture.asset('images/setting_icon.svg'))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: DefaultFieldForm(
                      controller: nameController,
                      keyboard: TextInputType.name,
                      valid: (value) {},
                      label: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: DefaultFieldForm(
                      controller: emailController,
                      keyboard: TextInputType.name,
                      valid: (value) {},
                      label: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: DefaultFieldForm(
                      controller: phoneController,
                      keyboard: TextInputType.name,
                      valid: (value) {},
                      label: 'Phone',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 70),
                    child: Text('Gender',style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.bold
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children:[
                        Expanded(
                          child: InkWell(
                            onTap:(){
                               cubit.changeGenderToMale();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:cubit.profileModel!.user!.gender=='male'?HexColor('#07094D'):Colors.grey[400],
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
                              cubit.changeGenderToFemale();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:cubit.profileModel!.user!.gender=='male'?Colors.grey[400]:HexColor('#07094D'),
                              ),
                              height: 53,
                              width: 160,
                              child:const Center(child: Text('Female',style: TextStyle(color: Colors.white),)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 20),
                    child: DefaultButton(
                      buttonWidget: const Text(
                        'confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                      function: () {
                        cubit.update(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                        );
                        showToast('Update successfully',ToastStates.SUCCESS);
                      },
                      backgroundColor: HexColor('#07094D'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
