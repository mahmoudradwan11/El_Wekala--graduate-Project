import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/core/network/constants.dart';
import 'package:el_wekala/core/network/remote/store_helper/store_helper.dart';
import 'package:el_wekala/core/themes/light.dart';
import 'package:el_wekala/modules/screens/layout.dart';
import 'package:el_wekala/modules/screens/login.dart';
import 'package:el_wekala/modules/screens/onboarding.dart';
import 'package:el_wekala/modules/screens/spalsh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/controllers/observer.dart';
import 'core/controllers/payment/payment_cubit.dart';
import 'core/controllers/store_cubit/store_cubit.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/payment_helper/payment_helper.dart';
import 'modules/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelperStore.init();
  DioHelperPayment.initDio();
  var onboarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  nationalId = CacheHelper.getData(key: 'userId');
  print('Token = $token');
  print('National Id = $nationalId');
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  Bloc.observer = MyBlocObserver();
  Widget? startScreen;
  if (onboarding != null) {
    if (token != null) {
      startScreen = const Home();
    } else {
      startScreen = const LayoutLoginAndRegister();
    }
  } else {
    startScreen = const OnBoardingScreen();
  }
  runApp(MyApp(
    startWidget: startScreen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({super.key, this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ElWekalaCubit()
            ..getUserData()
            ..getMyFavorite()
            ..getHomeLaptops()
            ..getHomeSmartPhone()
            ..getHomeSmartWatch()
            ..getHomeAccessories()
            ..getMyCart()
            ..getTotal()
            ..searchProduct(keyword:'')
            ..getAllProducts(keyword:'')
            ..getAllLaptops()
            ..getAllPhones()
              ..getHomeTvs()
              ..getAllTVS()
              ..getMessages()
              ..getFilter()
        ),
        BlocProvider(
            lazy: true, create: (context) => PaymentCubit()..getAuthToken()),
      ],
      child: BlocConsumer<ElWekalaCubit, ElWekalaStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'EL Wekala',
              theme: lightTheme,
              home: SplashScreen(nextScreen:startWidget!),
            );
          }),
    );
  }
}
