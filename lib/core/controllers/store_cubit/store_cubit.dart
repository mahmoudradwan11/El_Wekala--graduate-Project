import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/core/network/constants.dart';
import 'package:el_wekala/core/network/local/cache_helper.dart';
import 'package:el_wekala/core/network/remote/store_helper/store_helper.dart';
import 'package:el_wekala/core/themes/Icon_Borken.dart';
import 'package:el_wekala/models/store_model/cart.dart';
import 'package:el_wekala/models/store_model/cate.dart';
import 'package:el_wekala/models/store_model/custom_tap.dart';
import 'package:el_wekala/models/store_model/favorite.dart';
import 'package:el_wekala/models/store_model/filter.dart';
//import 'package:badges/badges.dart' as badges;
import 'package:el_wekala/models/store_model/fliter_products.dart';
import 'package:el_wekala/models/store_model/home/accessories.dart';
import 'package:el_wekala/models/store_model/home/laptop.dart';
import 'package:el_wekala/models/store_model/home/smart_tvs.dart';
import 'package:el_wekala/models/store_model/home/smartphone.dart';
import 'package:el_wekala/models/store_model/home/smartwatch.dart';
import 'package:el_wekala/models/store_model/laptops.dart';
import 'package:el_wekala/models/store_model/message.dart';
import 'package:el_wekala/models/store_model/notification.dart';
import 'package:el_wekala/models/store_model/phones.dart';
import 'package:el_wekala/models/store_model/review_model.dart';
import 'package:el_wekala/models/store_model/search.dart';
import 'package:el_wekala/models/store_model/search_fliter.dart';
import 'package:el_wekala/models/store_model/seller.dart';
import 'package:el_wekala/models/store_model/setting%20model.dart';
import 'package:el_wekala/models/store_model/sort.dart';
import 'package:el_wekala/models/store_model/top_seller.dart';
import 'package:el_wekala/models/store_model/tves.dart';
import 'package:el_wekala/models/store_model/user.dart';
import 'package:el_wekala/modules/screens/cart.dart';
import 'package:el_wekala/modules/screens/cate.dart';
import 'package:el_wekala/modules/screens/favorite.dart';
import 'package:el_wekala/modules/screens/login.dart';
import 'package:el_wekala/modules/screens/products.dart';
import 'package:el_wekala/modules/screens/setting.dart';
import 'package:el_wekala/modules/screens/sort.dart';
import 'package:el_wekala/modules/widgets/builders/mypainter.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:el_wekala/modules/widgets/functions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ElWekalaCubit extends Cubit<ElWekalaStates> {
  ElWekalaCubit() : super(InitState());

  static ElWekalaCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int currentTabViewIndex = 0;
  bool isMale = true;
  void changeToMale() {
    isMale = true;
    emit(IsMaleChoose());
  }

  void changeToFemale() {
    isMale = false;
    emit(IsFemaleChoose());
  }

  void changeView(int index) {
    currentTabViewIndex = index;
    emit(ChangeViewIndex());
  }

  void deleteUser(String email) {
    DioHelperStore.delData(
        url: 'https://elwekala.onrender.com/user/delete',
        data: {'email': email}).then((value) {
      emit(DeleteUser());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorDeleteUser());
    });
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

  bool sw1 = false;

  void changeSw1() {
    if (sw1 == true) {
      sw1 = false;
    } else {
      sw1 = true;
    }
    emit(ChangeSettingIndex());
  }

  bool sw2 = false;

  void changeSw2() {
    if (sw2 == true) {
      sw2 = false;
    } else {
      sw2 = true;
    }
    emit(ChangeSettingIndex());
  }

  bool sw3 = false;

  void changeSw3() {
    if (sw3 == true) {
      sw3 = false;
    } else {
      sw3 = true;
    }
    emit(ChangeSettingIndex());
  }

  bool sw4 = false;

  void changeSw4() {
    if (sw4 == true) {
      sw4 = false;
    } else {
      sw4 = true;
    }
    emit(ChangeSettingIndex());
  }

  bool sw5 = false;

  void changeSw5() {
    if (sw5 == true) {
      sw5 = false;
    } else {
      sw5 = true;
    }
    emit(ChangeSettingIndex());
  }

  var companyImage;

  chooseImageCompany(String name) {
    if (name == 'Dell') {
      companyImage = const NetworkImage(
          'https://xplorio.com/xplorio/content/81460/dell_logo_1619809179.jpg');
    } else if (name == 'HP') {
      companyImage = const NetworkImage(
          'https://th.bing.com/th/id/OIP.kXf_7FxVH0BSxhZDXcrGjgAAAA?pid=ImgDet&rs=1');
    } else if (name == 'Lenovo') {
      companyImage = const NetworkImage(
          'https://th.bing.com/th/id/R.a26ffa8eec943b3171aa399b77cacfd0?rik=z%2bhfYSG1MBAG6g&pid=ImgRaw&r=0');
    } else if (name == 'Samsung') {
      companyImage = const NetworkImage(
          'https://th.bing.com/th/id/R.67c218bc2d62796fabe836c8112e5a3a?rik=bPYsIShc0PJvUQ&riu=http%3a%2f%2ficons.iconarchive.com%2ficons%2falecive%2fflatwoken%2f512%2fApps-Samsung-icon.png&ehk=DAlqeet8nw2K9gw7QtDMrB63k2b97uyN2XpgEOi5f2g%3d&risl=&pid=ImgRaw&r=0');
    } else if (name == 'Xiaomi') {
      companyImage = const NetworkImage(
          'https://2.bp.blogspot.com/-yxbrZsZNLcE/WzXw-SupMvI/AAAAAAAAACw/rUStfzjHVmgrqpaiWrNjhMyRNYEhrjeYQCLcBGAs/s1600/Xiaomi%2BLogo%2BPNG%2BVector.png');
    } else {
      companyImage = const NetworkImage(
          'https://i.pinimg.com/originals/72/cb/ac/72cbac8133993c4d1d0dfa7514d72905.jpg');
    }
    emit(ChooseCompanyImage());
    return companyImage;
  }

  IconData favoriteIcon = Icons.favorite;
  List<GButton> tabs =const [
    GButton(
      icon: IconBroken.Home,
      text: 'Home',
    ),
    GButton(
      icon: Icons.favorite,
      text: 'Favorite',
    ),
    GButton(
      icon:IconBroken.Bag_2,
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
  List<CustomTapBar> customTap = [
    CustomTapBar('All', 0),
    CustomTapBar('New', 1),
    CustomTapBar('Used', 2)
  ];
  String? sortSelected = 'Recent';
  selectedSort(sort,context){
    sortSelected = sort;
    if(sortSelected=='Price'){
       navigateTo(context,SortProductsScreen());
    }
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
  SortModel? sortModel;
  void sortProduct(){
    DioHelperStore.getData(url:'https://elwekala.onrender.com/product/get/sorted-products').then((value){
     sortModel = SortModel.fromJson(value.data);
     print(sortModel!.products!.length);
     emit(SortProducts());
    }).catchError((error){
      print(error.toString());
      emit(ErrorSortProducts());
    });
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

  void layout(context) {
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

  void update({String? name, String? phone, String? email}) {
    DioHelperStore.putData(url: ApiConstant.UPDATE, data: {
      "token": token,
      "name": name,
      "email": email,
      "phone": phone,
      "password": "12345678",
      "gender": isMale ? 'male' : 'female',
    }).then((value) {
      profileModel = UserModel.fromJson(value.data);
      print(profileModel!.user!.name!);
      getUserData();
      emit(UserUpdateStates());
    }).catchError((error) {
      print(error.toString());
      emit(UserFailedUpdate());
    });
  }

  String? genderProfile;

  void changeGenderToFemale() {
    genderProfile = 'female';
    emit(MaleFalse());
  }

  void changeGenderToMale() {
    genderProfile = 'male';
    emit(MaleTrue());
  }

  int categoryIndex = 0;

  void changeCate(int cateIndex) {
    categoryIndex = cateIndex;
    print(categoryIndex);
    emit(ChangeCateIndex());
  }

  chooseColor(int index) {
    if (cate[index].index == categoryIndex) {
      return LinearGradient(
          colors: [HexColor('#7832A3'), HexColor('##07094D')]);
    } else {
      return LinearGradient(colors: [
        HexColor('#E6E7E8'),
        HexColor('#E6E7E8'),
      ]);
    }
  }

  FavoriteModel? favoriteModel;

  void getMyFavorite() {
    DioHelperStore.getData(url: ApiConstant.FAVORITE, data: {
      'nationalId': nationalId,
    }).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      print(favoriteModel!.favoriteProducts!.length);
      // print(favoriteModel!.favoriteProducts![0].name);
      emit(GetFavorite());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetFavorite());
    });
  }

  void addtoMyFavorite(String? id) {
    DioHelperStore.postData(
        url: ApiConstant.FAVORITE,
        data: {"nationalId": nationalId, "productId": id}).then((value) {
      print('Added');
      emit(AddToFavorite());
      showToast('Added', ToastStates.SUCCESS);
      getMyFavorite();
      getAllPhones();
      getAllLaptops();
      getHomeSmartWatch();
      getHomeLaptops();
      getHomeSmartPhone();
      getHomeTvs();
      getAllTVS();
      getHomeAccessories();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAddFavorite());
    });
  }

  void deleteFavorite(String? id) {
    DioHelperStore.delData(url: ApiConstant.FAVORITE, data: {
      "nationalId": nationalId,
      "productId": id,
    }).then((value) {
      print('Deleted');
      emit(DeleteFavorite());
      showToast('Deleted', ToastStates.ERROR);
      getMyFavorite();
      getAllPhones();
      getAllLaptops();
      getHomeSmartWatch();
      getHomeLaptops();
      getHomeSmartPhone();
      getHomeTvs();
      getAllTVS();
      getHomeAccessories();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorDeleteFavorite());
    });
  }

  void deleteNotification(notificationId){
    DioHelperStore.delData(url:'https://elwekala.onrender.com/notification/$notificationId').then((value){
      showToast('Deleted',ToastStates.ERROR);
      emit(DeleteNotification());
      if(state is DeleteNotification) {
        getAllNotification();
      }
    }).catchError((error){
      print(error.toString());
      emit(ErrorDeleteNotification());
    });
  }
  HomeLaptops? homeLaptops;
  void getHomeLaptops() {
    DioHelperStore.getData(
        url: ApiConstant.HOMELAPTOPS,
        data: {"nationalId": nationalId}).then((value) {
      homeLaptops = HomeLaptops.fromJson(value.data);
      print(homeLaptops!.usedProduct!.length);
      print(homeLaptops!.newProduct!.length);
      print('image 1 = ${homeLaptops!.newProduct![0].images![0]}');
      emit(GetHomeLaptops());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetHomeLaptops());
    });
  }

  HomeSmartPhone? homeSmartPhone;
  void getHomeSmartPhone() {
    DioHelperStore.getData(
        url: ApiConstant.HOMESMARTPHONE,
        data: {"nationalId": nationalId}).then((value) {
      homeSmartPhone = HomeSmartPhone.fromJson(value.data);
      print(homeSmartPhone!.usedProduct!.length);
      print(homeSmartPhone!.newProduct!.length);
      emit(GetHomeSmartPhone());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetHomeSmartPhone());
    });
  }

  HomeSmartWatch? homeSmartWatch;

  void getHomeSmartWatch() {
    DioHelperStore.getData(
        url: ApiConstant.HOMESMARTWATCHS,
        data: {"nationalId": nationalId}).then((value) {
      homeSmartWatch = HomeSmartWatch.fromJson(value.data);
      print(homeSmartWatch!.product!.length);
      print(homeSmartWatch!.message!);
      emit(GetHomeSmartWatch());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetHomeSmartWatch());
    });
  }

  CartModel? cartModel;
  void getMyCart() {
    DioHelperStore.getData(url: ApiConstant.GETMYCART, data: {
      "nationalId": nationalId,
    }).then((value) {
      cartModel = CartModel.fromJson(value.data);
      print('Number Of Products In Cart =${cartModel!.products!.length}');
      emit(GetCart());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetCart());
    });
  }
  TotalCart? totalCart;
  void getTotal(){
    DioHelperStore.getData(url: ApiConstant.TOTALPRICE, data: {
      "nationalId": nationalId,
    }).then((value) {
      totalCart = TotalCart.fromJson(value.data);
      print("Total=${totalCart!.totalPrice!}");
      emit(GetTotal());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetTotal());
    });
  }

  void deleteFromCart(productId) {
    DioHelperStore.delData(
        url: ApiConstant.DELETECART,
        data: {"nationalId": nationalId, "productId": productId}).then((value) {
      print('Deleted');
      emit(DeleteCart());
      getMyCart();
      getTotal();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorDeleteCart());
    });
  }

  void addToMyCart(productId) {
    DioHelperStore.postData(url: ApiConstant.ADDTOCART, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": "1"
    }).then((value) {
      print('Add');
      emit(AddToCart());
      getMyCart();
      getTotal();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAddToCart());
    });
  }

  void updateQuantity(productId, quantity) {
    DioHelperStore.putData(url: ApiConstant.UPDATEQUANTITY, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": quantity
    }).then((value) {
      print('Update');
      emit(UpdateQuantity());
      getMyCart();
      getTotal();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUpdateQuantity());
    });
  }
  SearchModel? searchModel;
  void searchProduct({required keyword}) {
    DioHelperStore.getData(url: ApiConstant.SEARCH, data: {'keyword': keyword})
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(searchModel!.products!.length);
      emit(SearchSuccessfully());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSearch());
    });
  }

  SearchFilterModel? searchFilterModel;
  void getAllProducts({required keyword}) {
    DioHelperStore.getData(url: ApiConstant.SEARCH, data: {'keyword': keyword})
        .then((value) {
      searchFilterModel = SearchFilterModel.fromJson(value.data);
      print(searchFilterModel!.usedProducts!.length);
      print(searchFilterModel!.newProducts!.length);
      emit(SearchSuccessfully());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSearch());
    });
  }

  Laptops? laptops;

  void getAllLaptops() {
    DioHelperStore.getData(
        url: ApiConstant.HOMELAPTOPS,
        data: {"nationalId": nationalId}).then((value) {
      laptops = Laptops.fromJson(value.data);
      print(laptops!.product!.length);
      emit(GetAllLaptops());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllLaptops());
    });
  }

  Phones? phones;

  void getAllPhones() {
    DioHelperStore.getData(
        url: ApiConstant.HOMESMARTPHONE,
        data: {"nationalId": nationalId}).then((value) {
      phones = Phones.fromJson(value.data);
      print(phones!.product!.length);
      emit(GetAllPhones());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllPhones());
    });
  }

  SellersModel? sellersModel;

  void getSellerProducts(seller) {
    DioHelperStore.getData(url: ApiConstant.SELLER, data: {"company": seller})
        .then((value) {
      sellersModel = SellersModel.fromJson(value.data);
      print(sellersModel!.products!.length);
      emit(GetAllSellerProducts());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllSellerProducts());
    });
  }

  FilterSellerModel? filterSellerModel;

  void getFilterSellerProducts(seller) {
    DioHelperStore.getData(url: ApiConstant.SELLER, data: {"company": seller})
        .then((value) {
      filterSellerModel = FilterSellerModel.fromJson(value.data);
      print(filterSellerModel!.usedProducts!.length);
      emit(GetAllSellerProducts());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllSellerProducts());
    });
  }

  void addReview(productId, comment, rate) {
    DioHelperStore.postData(url: 'https://elwekala.onrender.com/review', data: {
      "user": nationalId,
      "productId": productId,
      "title": "Good",
      "comment": comment,
      "rating": rate
    }).then((value) {
      showToast('Review Added', ToastStates.SUCCESS);
      getAllReviews(productId);
      emit(AddReview());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAddReview());
      showToast('Rating Must Not More Than 5', ToastStates.ERROR);
    });
  }

  ReviewModel? reviewModel;

  void getAllReviews(productId) {
    DioHelperStore.getData(
            url: 'https://elwekala.onrender.com/review/allreviews/$productId')
        .then((value) {
      reviewModel = ReviewModel.fromJson(value.data);
      print('Reviews = ${reviewModel!.reviews!.length}');
      emit(GetAllReviews());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllReviews());
    });
  }

  HomeTVS? homeTVS;

  void getHomeTvs() {
    DioHelperStore.getData(
        url: ApiConstant.HOMETVS,
        data: {"nationalId": nationalId}).then((value) {
      homeTVS = HomeTVS.fromJson(value.data);
      print(homeTVS!.usedProduct!.length);
      print(homeTVS!.newProduct!.length);
      emit(GetAllTvs());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllTvs());
    });
  }

  TVS? tvs;

  void getAllTVS() {
    DioHelperStore.getData(
        url: ApiConstant.HOMETVS,
        data: {"nationalId": nationalId}).then((value) {
      tvs = TVS.fromJson(value.data);
      print(tvs!.product!.length);
      print(tvs!.message!);
      emit(GetAllTvs());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllTvs());
    });
  }

  HomeAccessories? homeAccessories;
  void getHomeAccessories() {
    DioHelperStore.getData(
        url: ApiConstant.HOMEAC,
        data: {"nationalId": nationalId}).then((value) {
      homeAccessories = HomeAccessories.fromJson(value.data);
      // print(homeAccessories!.product!.length);
      // print(homeAccessories!.message!);
      emit(GetAllAcc());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllAcc());
    });
  }

  MessagesModel? messagesModel;
  void getMessages() {
    DioHelperStore.getData(url: 'https://elwekala.onrender.com/chat/', data: {
      "senderNationalId": nationalId,
      "receiverNationalId": "30103131301721"
    }).then((value) {
      messagesModel = MessagesModel.fromJson(value.data);
      print(messagesModel!.messages!.length);
      emit(GetAllMessages());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllMessages());
    });
  }

  void sendMessage(content) {
    DioHelperStore.postData(url: 'https://elwekala.onrender.com/chat/', data: {
      "senderNationalId": nationalId,
      "receiverNationalId": "30103131301721",
      "content": content
    }).then((value) {
      emit(SendMessage());
      getMessages();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSendMessage());
    });
  }

  void showAlert(context) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Send Success',
        text: 'We will work on your complaint ');
  }

  void sendReport(problem, context) {
    DioHelperStore.postData(
        url: 'https://elwekala.onrender.com/report',
        data: {"nationalId": nationalId, "problem": problem}).then((value) {
      emit(SendContact());
      showAlert(context);
    }).catchError((error) {
      print(error.toString());
      emit(ErrorContact());
      showToast('Please Write your Complaint', ToastStates.ERROR);
    });
  }

  FilterProducts? filterProducts;
  void getFilter({min, max, category, company}) {
    DioHelperStore.getData(
        url: 'https://elwekala.onrender.com/product/filer/get',
        data: {
          "categories": [
            "Smart Phones",
          ],
          "companies": ["Samsung"],
          "minPrice": 1,
          "maxPrice": 1000
        }).then((value) {
      filterProducts = FilterProducts.fromJson(value.data);
      print(filterProducts!.products!.length);
      emit(GetFilter());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorFilter());
    });
  }

  bool apple = false;
  bool xiaomi = false;
  bool samsung = false;
  bool huawei = false;
  bool lap = false;
  bool smartphone = false;
  bool smartWatches = false;
  bool smartTvs = false;
  bool acc = false;

  void checkApple(value) {
    apple = value;
    emit(CheckApple());
  }

  void checkXiaomi(value) {
    xiaomi = value;
    emit(CheckXiaomi());
  }

  void checkSamsung(value) {
    samsung = value;
    emit(CheckSamsung());
  }

  void checkHuawei(value) {
    huawei = value;
    emit(CheckHuawei());
  }

  void checkLap(value) {
    lap = value;
    emit(CheckLap());
  }

  void checkPhone(value) {
    smartphone = value;
    emit(CheckPhones());
  }

  void checkWatch(value) {
    smartWatches = value;
    emit(CheckWatches());
  }

  void checkTv(value) {
    smartTvs = value;
    emit(CheckTvs());
  }

  void checkAcc(value) {
    acc = value;
    emit(CheckAcc());
  }
  void addSales(productId){
    DioHelperStore.postData(url:'https://elwekala.onrender.com/product/add/sale', data:{
        "productId":productId
    }).then((value){
      emit(AddSales());
      getTopSeller();
    }).catchError((error){
      print(error.toString());
      emit(ErrorAddSales());
    });
  }
  void deleteReview(reviewId,productId){
    DioHelperStore.delData(url:'https://elwekala.onrender.com/review/$reviewId',).then((value){
      emit(DeleteReview());
      getAllReviews(productId);
    }).catchError((error){
      print(error.toString());
    });
  }
  NotificationModel? notificationModel;
  void getAllNotification(){
    DioHelperStore.getData(url:'https://elwekala.onrender.com/notification/').then((value){
      notificationModel = NotificationModel.fromJson(value.data);
      emit(GetNotification());
    }).catchError((error){
  print(error.toString());
  emit(ErrorGetNotification());
    });
  }
  TopSellerModel? topSellerModel;
  void getTopSeller(){
    DioHelperStore.getData(url:'https://elwekala.onrender.com/product/get/top-sellers',data:{
        "limit": 900
    }).then((value){
        topSellerModel = TopSellerModel.fromJson(value.data);
        print(topSellerModel!.topSellingCompany![0].sId);
        emit(GetTopSeller());
    }).catchError((error){
    print(error.toString());
    emit(ErrorGetTopSeller());
    });
  }
}
