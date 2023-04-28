import 'package:el_wekala/models/store_model/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildOnBoardingItem(OnBoardingModel onBoardingModel) => Container(
  width: double.infinity,
  child: Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Positioned(
        top: 100,
        left: 50,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: HexColor('#07094D'),
        ),
      ),
      Positioned(
        top: onBoardingModel.image2 == 'images/lap_onboarding.png'
            ? 110
            : 90,
        left: onBoardingModel.image2 == 'images/lap_onboarding.png'
            ? 45
            : 40,
        child: Image(
          image: AssetImage(
            onBoardingModel.image2,
          ),
          height: onBoardingModel.image2 == 'images/lap_onboarding.png'
              ? 65
              : 90,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: 120,
        right: 50,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: HexColor('#07094D'),
        ),
      ),
      Positioned(
        top: onBoardingModel.image3 == 'images/lap_onboarding.png'
            ? 125
            : 115,
        right: onBoardingModel.image3 == 'images/lap_onboarding.png'
            ? 50
            : 40,
        child: Image(
          image: AssetImage(onBoardingModel.image3),
          height: onBoardingModel.image3 == 'images/lap_onboarding.png'
              ? 65
              : 90,
          fit: BoxFit.contain,
        ),
      ),
      CircleAvatar(
        radius: 80,
        backgroundColor: HexColor('#07094D'),
      ),
      Positioned(
        bottom: onBoardingModel.image1 == 'images/s.png' ? 0 : 20,
        child: Image(
          image: AssetImage(
            onBoardingModel.image1,
          ),
          fit: onBoardingModel.image1 == 'images/s.png'
              ? BoxFit.contain
              : BoxFit.cover,
          height: onBoardingModel.image1 == 'images/s.png' ? 180 : null,
        ),
      ),
    ],
  ),
);
