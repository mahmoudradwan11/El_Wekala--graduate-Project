import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/core/themes/Icon_Borken.dart';
import 'package:el_wekala/models/store_model/custom_tap.dart';
import 'package:el_wekala/models/store_model/setting%20model.dart';
import 'package:el_wekala/modules/screens/cart.dart';
import 'package:el_wekala/modules/screens/cate.dart';
import 'package:el_wekala/modules/screens/favorite.dart';
import 'package:el_wekala/modules/screens/products.dart';
import 'package:el_wekala/modules/screens/setting.dart';
import 'package:el_wekala/modules/widgets/builders/mypainter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
class ElWekalaCubit extends Cubit<ElWekalaStates> {
  ElWekalaCubit() : super(InitState());

  static ElWekalaCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  IconData favoriteIcon = Icons.favorite;
  List<GButton> tabs =const [
    GButton(icon:IconBroken.Home,text: 'Home',),
    GButton(icon: Icons.favorite,text: 'Favorite',),
    GButton(icon:IconBroken.Bag_2,text: 'Cart',),
    GButton(icon:IconBroken.Category,text: 'Category',),
    GButton(icon:Icons.settings,text:'Setting')
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
  Future<void>addImage()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile !=null){
      image=File(pickedFile.path);
      bytes = File(image!.path).readAsBytesSync();
      img64 = base64Encode(bytes!);
      print('images = $img64');
      emit(ImageChoose());
    }
    else{
      print('no image selected');
    }
  }
  List<CustomTapBar>customTap=[
    CustomTapBar('All', 0),
    CustomTapBar('New', 1),
    CustomTapBar('Used',2)
  ];
  String? sortSelected = 'SortBy';
  selectedSort(sort){
    sortSelected = sort;
    emit(SelectSort());

  }
  int customIndex = 0;
  int settingIndex = 0;
  chooseColorCustom(int index){
    if(customTap[index].index == customIndex)
    {
      return LinearGradient(colors:[
        HexColor('#7832A3'),
        HexColor('#07094D')
      ]);
    }
    else{
      return LinearGradient(colors:[
        Colors.grey[400]!,
        Colors.grey[400]!,
      ]);
    }
  }
  void change(int customTapIndex){
    customIndex = customTapIndex;
    print(customIndex);
    emit(ChangeCustomIndex());
  }
  List<SettingModel> setting = [
    SettingModel('Settings',Icons.settings,0),
    SettingModel('Payment',Icons.payment_rounded,1),
    SettingModel('Notifications',Icons.notifications,2)
  ];
  CustomPainter chooseColorSetting(int index){
    if(setting[index].index == settingIndex)
    {
      return MyPainterSelected();
    }
    else{
      return MyPainterUnSelected();
    }
  }
  void changeSetting(int settingindex){
    settingIndex =settingindex;
    print(settingIndex);
    emit(ChangeSettingIndex());
  }
}