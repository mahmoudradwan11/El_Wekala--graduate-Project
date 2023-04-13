import 'package:el_wekala/core/controllers/login_cubit/login_states.dart';
import 'package:el_wekala/core/network/constants.dart';
import 'package:el_wekala/core/network/remote/store_helper/store_helper.dart';
import 'package:el_wekala/models/store_model/user.dart';
import 'package:el_wekala/modules/widgets/functions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? loginModel;
  IconData suffixIcon = Icons.visibility;
  bool passwordShow = true;
  void loginUser({required String email, required String password}) {
    emit(LoadingLogin());
    DioHelperStore.postData(url:ApiConstant.LOGIN, data: {
      "email": email,
      "password":password
    }).then((value) {
      loginModel = UserModel.fromJson(value.data);
      if (loginModel!.message != 'User logged in successfully') {
        showToast(loginModel!.message!, ToastStates.ERROR);
      }
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error);
      emit(LoginFailedState(error.toString()));
    });
  }
  void changePasswordIcon() {
    passwordShow = !passwordShow;
    suffixIcon =
    passwordShow ? Icons.visibility : Icons.visibility_off_outlined;
    emit(ChangePasswordVisState());
  }
}
