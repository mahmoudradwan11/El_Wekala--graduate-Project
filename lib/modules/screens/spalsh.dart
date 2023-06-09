import 'dart:async';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  Widget nextScreen;
  SplashScreen({Key? key, required this.nextScreen}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState(nextScreen);
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState(this.nextScreen);
  Widget nextScreen;
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  void _goNext() {
    //navigateAndReplace(context,Routes.onBoardingRoute);
    navigateAndFinish(context, nextScreen);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SvgPicture.asset('images/El Wekala.svg'),
            ],
          ),
        )
    );
  }

  @override
  dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
