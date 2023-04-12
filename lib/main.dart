import 'package:el_wekala/core/controllers/store_cubit/store_states.dart';
import 'package:el_wekala/core/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/controllers/observer.dart';
import 'core/controllers/payment/payment_cubit.dart';
import 'core/controllers/store_cubit/store_cubit.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/payment_helper/payment_helper.dart';
import 'modules/screens/home.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelperPayment.initDio();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ElWekalaCubit()
        ),
        BlocProvider(
          lazy:false,
            create: (context) =>
            PaymentCubit()
              ..getAuthToken()),
      ],
      child: BlocConsumer<ElWekalaCubit, ElWekalaStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'EL Wekala',
              theme: lightTheme,
              home: const Home(),
            );
          }
      ),
    );
  }
}
