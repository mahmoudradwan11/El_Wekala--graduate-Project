import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/core/network/constants.dart';
import 'package:el_wekala/core/network/local/cache_helper.dart';
import 'package:el_wekala/core/network/remote/store_helper/store_helper.dart';
import 'package:el_wekala/core/themes/Icon_Borken.dart';
import 'package:el_wekala/models/store_model/cart.dart';
import 'package:el_wekala/models/store_model/cate.dart';
import 'package:el_wekala/models/store_model/custom_tap.dart';
import 'package:el_wekala/models/store_model/favorite.dart';
import 'package:el_wekala/models/store_model/home/laptop.dart';
import 'package:el_wekala/models/store_model/home/smartphone.dart';
import 'package:el_wekala/models/store_model/home/smartwatch.dart';
import 'package:el_wekala/models/store_model/laptops.dart';
import 'package:el_wekala/models/store_model/phones.dart';
import 'package:el_wekala/models/store_model/search.dart';
import 'package:el_wekala/models/store_model/search_fliter.dart';
import 'package:el_wekala/models/store_model/setting%20model.dart';
import 'package:el_wekala/models/store_model/user.dart';
import 'package:el_wekala/modules/screens/cart.dart';
import 'package:el_wekala/modules/screens/cate.dart';
import 'package:el_wekala/modules/screens/favorite.dart';
import 'package:el_wekala/modules/screens/login.dart';
import 'package:el_wekala/modules/screens/products.dart';
import 'package:el_wekala/modules/screens/setting.dart';
import 'package:el_wekala/modules/widgets/builders/mypainter.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:el_wekala/modules/widgets/functions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class ElWekalaCubit extends Cubit<ElWekalaStates> {
  ElWekalaCubit() : super(InitState());

  static ElWekalaCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int currentTabViewIndex = 0;
  void changeView(int index){
    currentTabViewIndex = index;
    emit(ChangeViewIndex());
  }
  bool swi = false;
  void changeSwi() {
    if (swi == true) {
      swi = false;
    } else {
      swi = true;
    }
    emit(ChangeSettingIndex());
  }

  IconData favoriteIcon = Icons.favorite;
  List<GButton> tabs = const [
    GButton(
      icon: IconBroken.Home,
      text: 'Home',
    ),
    GButton(
      icon: Icons.favorite,
      text: 'Favorite',
    ),
    GButton(
      icon: IconBroken.Bag_2,
      text: 'Cart',
    ),
    GButton(
      icon: IconBroken.Category,
      text: 'Category',
    ),
    GButton(icon: Icons.settings, text: 'Setting')
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeScreenIndex());
  }
  List<Widget> screens = [
    Products(),
    Favorite(),
    Cart(),
    Cateogry(),
    Setting(),
  ];
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

  List<CustomTapBar> customTap = [
    CustomTapBar('All', 0),
    CustomTapBar('New', 1),
    CustomTapBar('Used', 2)
  ];
  String? sortSelected = 'SortBy';
  selectedSort(sort) {
    sortSelected = sort;
    emit(SelectSort());
  }

  int customIndex = 0;
  int settingIndex = 0;
  chooseColorCustom(int index) {
    if (customTap[index].index == customIndex) {
      return LinearGradient(colors: [HexColor('#7832A3'), HexColor('#07094D')]);
    } else {
      return LinearGradient(colors: [
        HexColor('#DBDBDB'),
        HexColor('#DBDBDB'),
      ]);
    }
  }

  void change(int customTapIndex) {
    customIndex = customTapIndex;
    print(customIndex);
    emit(ChangeCustomIndex());
  }

  List<SettingModel> setting = [
    SettingModel('Settings', Icons.settings, 0),
    SettingModel('Payment', Icons.payment_rounded, 1),
    SettingModel('Notifications', Icons.notifications, 2)
  ];
  CustomPainter chooseColorSetting(int index) {
    if (setting[index].index == settingIndex) {
      return MyPainterSelected();
    } else {
      return MyPainterUnSelected();
    }
  }

  void changeSetting(int settingindex) {
    settingIndex = settingindex;
    print(settingIndex);
    emit(ChangeSettingIndex());
  }

  UserModel? profileModel;
  void getUserData() {
    DioHelperStore.postData(
      url: ApiConstant.PR0FILE,
      data: {"token": token},
    ).then((value) {
      profileModel = UserModel.fromJson(value.data);
      print(profileModel!.user!.name);
      print(profileModel!.user!.email);
      emit(UserDataSuccessState(profileModel));
    }).catchError((error) {
      print(error.toString());
      emit(UserDataFailedState());
    });
  }
  void layout(context){
        DioHelperStore.postData(
          url: ApiConstant.LAGOUT,
          data: {"token": token},
        ).then((value) {
          CacheHelper.removeData(key: 'token').then((value) {
            if (value) {
              navigateAndFinish(context, Login());
        }
            emit(UserLogoutState());
          }).catchError((error) {
          print(error.toString());
          emit(UserLogoutFailedState());
        });
    });
}
void update({String? name,String? phone,String? email}){
    DioHelperStore.putData(url:ApiConstant.UPDATE, data:{
      "token":token,
      "name":name,
      "email":email,
      "phone":phone,
      "gender":genderProfile ?? profileModel!.user!.gender,
    }).then((value){
       profileModel = UserModel.fromJson(value.data);
       print(profileModel!.user!.name!);
       emit(UserUpdateStates());
    }).catchError((error){
      print(error.toString());
      emit(UserFailedUpdate());
    });
}
  String? genderProfile;
  void changeGenderToFemale(){
    genderProfile = 'female';
    emit(MaleFalse());
  }
  void  changeGenderToMale(){
    genderProfile = 'male';
    emit(MaleTrue());
  }
  int categoryIndex = 0;
  void changeCate(int cateIndex){
    categoryIndex = cateIndex;
    print(categoryIndex);
    emit(ChangeCateIndex());
  }
  chooseColor(int index){
    if(cate[index].index == categoryIndex)
    {
      return LinearGradient(colors:[
        HexColor('#7832A3'),
        HexColor('##07094D')
      ]);
    }
    else{
      return LinearGradient(colors: [
        HexColor('#E6E7E8'),
        HexColor('#E6E7E8'),
      ]);
    }
  }
  FavoriteModel? favoriteModel;
  void getMyFavorite(){
    DioHelperStore.getData(url: ApiConstant.FAVORITE,data:{
      'nationalId':nationalId,
    }).then((value){
      favoriteModel = FavoriteModel.fromJson(value.data);
      print(favoriteModel!.favoriteProducts!.length);
     // print(favoriteModel!.favoriteProducts![0].name);
      emit(GetFavorite());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetFavorite());
    });
  }
  void addtoMyFavorite(String? id){
    DioHelperStore.postData(url:ApiConstant.FAVORITE, data:{
      "nationalId":nationalId,
      "productId":id
    }).then((value){
      print('Added');
      emit(AddToFavorite());
      showToast('Added',ToastStates.SUCCESS);
      getMyFavorite();
    }).catchError((error){
      print(error.toString());
      emit(ErrorAddFavorite());
    });
  }
  void deleteFavorite(String? id){
    DioHelperStore.delData(url:ApiConstant.FAVORITE, data:{
        "nationalId":nationalId,
        "productId":id,
    }).then((value){
      print('Deleted');
      emit(DeleteFavorite());
      showToast('Deleted',ToastStates.ERROR);
      getMyFavorite();
    }).catchError((error){
      print(error.toString());
      emit(ErrorDeleteFavorite());
    });
  }
  HomeLaptops? homeLaptops;
  void getHomeLaptops(){
    DioHelperStore.getData(url:ApiConstant.HOMELAPTOPS).then((value){
      homeLaptops = HomeLaptops.fromJson(value.data);
      print(homeLaptops!.usedProduct!.length);
      print(homeLaptops!.newProduct!.length);
      emit(GetHomeLaptops());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetHomeLaptops());
    });
  }
  HomeSmartPhone? homeSmartPhone;
  void getHomeSmartPhone(){
    DioHelperStore.getData(url:ApiConstant.HOMESMARTPHONE).then((value){
      homeSmartPhone = HomeSmartPhone.fromJson(value.data);
      print(homeSmartPhone!.usedProduct!.length);
      print(homeSmartPhone!.newProduct!.length);
      emit(GetHomeSmartPhone());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetHomeSmartPhone());
    });
  }
  HomeSmartWatch? homeSmartWatch;
  void getHomeSmartWatch(){
    DioHelperStore.getData(url:ApiConstant.HOMESMARTWATCHS).then((value){
      homeSmartWatch = HomeSmartWatch.fromJson(value.data);
      print(homeSmartWatch!.product!.length);
      print(homeSmartWatch!.message!);
      emit(GetHomeSmartWatch());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetHomeSmartWatch());
    });
  }
  CartModel? cartModel;
  void getMyCart(){
    DioHelperStore.getData(url:ApiConstant.GETMYCART,data: {
      "nationalId":nationalId,
    }).then((value){
      cartModel = CartModel.fromJson(value.data);
      print(cartModel!.products!.length);
      emit(GetCart());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetCart());
    });
  }
  TotalCart? totalCart;
  void getTotal(){
    DioHelperStore.getData(url:ApiConstant.TOTALPRICE,data: {
      "nationalId":nationalId,
    }).then((value){
      totalCart = TotalCart.fromJson(value.data);
      print("Total=${totalCart!.totalPrice!}");
      emit(GetTotal());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetTotal());
    });
  }
  void deleteFromCart(productId){
    DioHelperStore.delData(url:ApiConstant.DELETECART, data:{
      "nationalId":nationalId,
      "productId":productId
    }).then((value){
      print('Deleted');
      emit(DeleteCart());
      getMyCart();
      getTotal();
    }).catchError((error){
     print(error.toString());
     emit(ErrorDeleteCart());
    });
  }
  void addToMyCart(productId){
    DioHelperStore.postData(url: ApiConstant.ADDTOCART, data:{
      "nationalId":nationalId,
      "productId":productId,
      "quantity":"1"
    }).then((value){
       print('Add');
       emit(AddToCart());
       showToast('Add', ToastStates.SUCCESS);
       getMyCart();
       getTotal();
    }).catchError((error){
      print(error.toString());
      emit(ErrorAddToCart());
    });
  }
  void updateQuantity(productId,quantity){
    DioHelperStore.putData(url:ApiConstant.UPDATEQUANTITY, data:{
        "nationalId":nationalId,
        "productId":productId,
        "quantity":quantity
    }).then((value){
      print('Update');
      emit(UpdateQuantity());
      getMyCart();
      getTotal();
    }).catchError((error){
      print(error.toString());
      emit(ErrorUpdateQuantity());
    });
  }
  SearchModel? searchModel;
  void searchProduct({required keyword}){
    DioHelperStore.getData(url:ApiConstant.SEARCH,data: {
        'keyword':keyword
    }).then((value){
      searchModel = SearchModel.fromJson(value.data);
      print(searchModel!.products!.length);
      emit(SearchSuccessfully());
    }).catchError((error){
      print(error.toString());
      emit(ErrorSearch());
    });
  }
  SearchFilterModel? searchFilterModel;
  void getAllProducts({required keyword}){
    DioHelperStore.getData(url:ApiConstant.SEARCH,data: {
      'keyword':keyword
    }).then((value){
      searchFilterModel = SearchFilterModel.fromJson(value.data);
      print(searchFilterModel!.usedProducts!.length);
      print(searchFilterModel!.newProducts!.length);
      emit(SearchSuccessfully());
    }).catchError((error){
      print(error.toString());
      emit(ErrorSearch());
    });
  }
  Laptops? laptops;
  void getAllLaptops(){
    DioHelperStore.getData(url:ApiConstant.HOMELAPTOPS).then((value){
      laptops =Laptops.fromJson(value.data);
      print(laptops!.product!.length);
      emit(GetAllLaptops());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetAllLaptops());
    });
  }
  Phones? phones;
  void getAllPhones(){
    DioHelperStore.getData(url:ApiConstant.HOMESMARTPHONE).then((value){
      phones =Phones.fromJson(value.data);
      print(phones!.product!.length);
      emit(GetAllPhones());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetAllPhones());
    });
  }
}

