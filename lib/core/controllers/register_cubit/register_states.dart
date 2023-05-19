import 'package:el_wekala/models/store_model/user.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final UserModel loginModel;
  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterStates {}
class ImageChoose extends RegisterStates{}

