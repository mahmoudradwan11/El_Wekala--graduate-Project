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
class GetFavorite extends ElWekalaStates{}
class ErrorGetFavorite extends ElWekalaStates{}
class DeleteFavorite extends ElWekalaStates{}
class ErrorDeleteFavorite extends ElWekalaStates{}
class AddToFavorite extends ElWekalaStates{}
class ErrorAddFavorite extends ElWekalaStates{}
class GetHomeLaptops extends ElWekalaStates{}
class ErrorGetHomeLaptops extends ElWekalaStates{}
class GetHomeSmartPhone extends ElWekalaStates{}
class ErrorGetHomeSmartPhone extends ElWekalaStates{}
class GetHomeSmartWatch extends ElWekalaStates{}
class ErrorGetHomeSmartWatch extends ElWekalaStates{}
class AddToCart extends ElWekalaStates{}
class ErrorAddToCart extends ElWekalaStates{}
class GetCart extends ElWekalaStates{}
class ErrorGetCart extends ElWekalaStates{}
class GetTotal extends ElWekalaStates{}
class ErrorGetTotal extends ElWekalaStates{}
class DeleteCart extends ElWekalaStates{}
class ErrorDeleteCart extends ElWekalaStates{}
class UpdateQuantity extends ElWekalaStates{}
class ErrorUpdateQuantity extends ElWekalaStates{}
class ChangeQuantity extends ElWekalaStates{}


