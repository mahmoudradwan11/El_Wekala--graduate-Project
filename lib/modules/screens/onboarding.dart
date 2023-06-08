import 'package:el_wekala/core/network/local/cache_helper.dart';
import 'package:el_wekala/models/store_model/onboarding.dart';
import 'package:el_wekala/modules/screens/layout.dart';
import 'package:el_wekala/modules/widgets/builders/build_onboarding.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  var boardController = PageController();
  var isLast = false;
  var screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          const SizedBox(
            height: 100,
          ),
          const Image(image: AssetImage('images/El Wekala.png')),
          Container(
            height: 400,
            width: double.infinity,
            child: PageView.builder(
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                    screenIndex = index;
                  });
                } else {
                  setState(() {
                    isLast = false;
                    screenIndex = index;
                  });
                }
              },
              physics: const BouncingScrollPhysics(),
              controller: boardController,
              itemBuilder: (context, index) =>
                  buildOnBoardingItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Discover New local products',
            style: TextStyle(
                color: HexColor('#07094D'),
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, top: 10),
            child: Text(
              'We Have a 100k+ Products. Choose Your product from our E-commerce shop.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          isLast
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DefaultButton(
                    buttonWidget: const Text(
                      'GetStarted',
                      style: TextStyle(color: Colors.white),
                    ),
                    function: () {
                      submit();
                    },
                    backgroundColor: HexColor('#07094D'),
                    borderColor: Colors.transparent,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DefaultButton(
                      buttonWidget: const Text('Next',
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: HexColor('#07094D'),
                      borderColor: Colors.transparent,
                      function: () {
                        boardController.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }),
                ),
          const SizedBox(
            height: 10,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                      onPressed: () {
                        boardController.previousPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(color: screenIndex==0?Colors.transparent:HexColor('#000000')),
                      ),
                    ),
                 SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    dotHeight: 5,
                    activeDotColor: HexColor('#07094D'),
                    dotWidth: 10,
                    dotColor: HexColor('#AFAFAF'),
                    // expansionFactor: 4,
                    spacing: 5.0,
                  ),
                  controller: boardController,
                  count: boarding.length),
                  MaterialButton(
                      onPressed: () {
                        submit();
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(color: screenIndex==2?Colors.transparent:HexColor('#07094D')),
                      ),
                    )
            ]),
          )
        ]));
  }

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context,const LayoutLoginAndRegister());
      }
    });
  }

}
