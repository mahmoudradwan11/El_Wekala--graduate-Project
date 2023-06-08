import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:el_wekala/core/controllers/register_cubit/register_states.dart';
import 'package:el_wekala/core/network/constants.dart';
import 'package:el_wekala/core/network/remote/store_helper/store_helper.dart';
import 'package:el_wekala/models/store_model/user.dart';
import 'package:el_wekala/modules/widgets/functions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isMale = true;
  UserModel? loginModel;
  void userRegister({required String name, required String email, required String password, required String phone, required String nationalId,}) {
    emit(RegisterLoadingState());
    DioHelperStore.postData(
      url: ApiConstant.REGISTER,
      data: {
        'name': name, 'email': email, 'password': password, 'phone': phone, 'nationalId': nationalId,
        'gender': isMale ? 'male' : 'female',
        'profileImage': img64
      },
    ).then((value) {
      print(value.data);
      loginModel = UserModel.fromJson(value.data);
      if (loginModel!.message != 'User registered successfully') {
        showToast(loginModel!.message!, ToastStates.ERROR);}
      emit(RegisterSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }

  ImagePicker picker = ImagePicker();
  File? image;
  Uint8List? bytes;
  String? img64;
  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      bytes = File(image!.path).readAsBytesSync();
      img64 = base64Encode(bytes!);
      print('images = $img64');
      emit(ImageChoose());
    } else {
      print('no image selected');
    }
  }

  void changeToMale() {
    isMale = true;
    emit(IsMaleChoose());
  }

  void changeToFemale() {
    isMale = false;
    emit(IsFemaleChoose());
  }
}
