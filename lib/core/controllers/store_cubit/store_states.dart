import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/models/store_model/user.dart';
abstract class ElWekalaStates{}
class InitState extends ElWekalaStates{}
class ChangeScreenIndex extends ElWekalaStates{}
class ChangeCustomIndex extends ElWekalaStates{}
class ChangeSettingIndex extends ElWekalaStates{}
class SelectSort extends ElWekalaStates{}
class UserDataSuccessState extends ElWekalaStates {
  UserModel? userModel;
  UserDataSuccessState(this.userModel);
}
class SortProducts extends ElWekalaStates{}
class ErrorSortProducts extends ElWekalaStates{}
class UserDataFailedState extends ElWekalaStates {}
class UserLogoutState extends ElWekalaStates {}
class UserLogoutFailedState extends ElWekalaStates {}
class UserUpdateStates extends ElWekalaStates{}
class UserFailedUpdate extends ElWekalaStates{}
class MaleTrue extends ElWekalaStates {}
class MaleFalse extends ElWekalaStates {}
class ChangeCateIndex extends ElWekalaStates{}
class ChangeViewIndex extends ElWekalaStates{}
class IsMaleChoose extends ElWekalaStates{}
class IsFemaleChoose extends ElWekalaStates{}
class GetFavorite extends ElWekalaStates{}
class ErrorGetFavorite extends ElWekalaStates{}
class DeleteFavorite extends ElWekalaStates{}
class ErrorDeleteFavorite extends ElWekalaStates{}
class AddToFavorite extends ElWekalaStates{}
class ErrorAddFavorite extends ElWekalaStates{}
class DeleteUser extends ElWekalaStates{}
class ErrorDeleteUser extends ElWekalaStates{}
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
class SearchSuccessfully extends ElWekalaStates{}
class ErrorSearch extends ElWekalaStates{}
class GetAllLaptops extends ElWekalaStates{}
class ErrorGetAllLaptops extends ElWekalaStates{}
class GetAllPhones extends ElWekalaStates{}
class ErrorGetAllPhones extends ElWekalaStates{}
class ChooseCompanyImage extends ElWekalaStates{}
class GetAllSellerProducts extends ElWekalaStates{}
class ErrorGetAllSellerProducts extends ElWekalaStates{}
class AddReview extends ElWekalaStates{}
class ErrorAddReview extends ElWekalaStates{}
class GetAllReviews extends ElWekalaStates{}
class ErrorGetAllReviews extends ElWekalaStates{}
class GetAllAcc extends ElWekalaStates{}
class ErrorGetAllAcc extends ElWekalaStates{}
class GetAllTvs extends ElWekalaStates{}
class ErrorGetAllTvs extends ElWekalaStates{}
class GetAllMessages extends ElWekalaStates{}
class ErrorGetAllMessages extends ElWekalaStates{}
class SendMessage extends ElWekalaStates{}
class ErrorSendMessage extends ElWekalaStates{}
class SendContact extends ElWekalaStates {}
class ErrorContact extends ElWekalaStates {}
class GetFilter extends ElWekalaStates{}
class ErrorFilter extends ElWekalaStates{}
class CheckApple extends ElWekalaStates{}
class CheckXiaomi extends ElWekalaStates{}
class CheckSamsung extends ElWekalaStates{}
class CheckHuawei extends ElWekalaStates{}
class CheckLap extends ElWekalaStates{}
class CheckPhones extends ElWekalaStates{}
class CheckTvs extends ElWekalaStates{}
class CheckWatches extends ElWekalaStates{}
class CheckAcc extends ElWekalaStates{}
class DeleteReview extends ElWekalaStates{}
class ErrorDeleteReview extends ElWekalaStates{}
class AddSales extends ElWekalaStates{}
class ErrorAddSales extends ElWekalaStates{}
class GetNotification extends ElWekalaStates{}
class ErrorGetNotification extends ElWekalaStates{}
class GetTopSeller extends ElWekalaStates{}
class ErrorGetTopSeller extends ElWekalaStates{}
class DeleteNotification extends ElWekalaStates{}
class ErrorDeleteNotification extends ElWekalaStates{}

