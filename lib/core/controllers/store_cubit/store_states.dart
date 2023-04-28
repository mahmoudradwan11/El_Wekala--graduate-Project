import 'package:el_wekala/models/store_model/user.dart';
abstract class ElWekalaStates{}
class InitState extends ElWekalaStates{}
class ChangeScreenIndex extends ElWekalaStates{}
class ImageChoose extends ElWekalaStates{}
class ChangeCustomIndex extends ElWekalaStates{}
class ChangeSettingIndex extends ElWekalaStates{}
class SelectSort extends ElWekalaStates{}
class UserDataSuccessState extends ElWekalaStates {
  UserModel? userModel;
  UserDataSuccessState(this.userModel);
}
class UserDataFailedState extends ElWekalaStates {}
class UserLogoutState extends ElWekalaStates {}
class UserLogoutFailedState extends ElWekalaStates {}
class UserUpdateStates extends ElWekalaStates{}
class UserFailedUpdate extends ElWekalaStates{}
class MaleTrue extends ElWekalaStates {}
class MaleFalse extends ElWekalaStates {}
class ChangeCateIndex extends ElWekalaStates{}
class ChangeViewIndex extends ElWekalaStates{}



