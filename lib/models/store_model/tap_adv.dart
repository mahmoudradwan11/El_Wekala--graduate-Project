import 'package:el_wekala/modules/screens/chat.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class TapAdvicer {
  String title;
  String image;
  String imageLink;
  String name;
  TapAdvicer(this.title, this.image,this.name,this.imageLink);
}
List<TapAdvicer>tap = [
  TapAdvicer('Unbelievable Visual & Performance','images/top.png','ZedBook Duo','https://techstoriesindia.in/wp-content/uploads/2021/06/Asus-ZenBook-Pro-Duo-OLED-2021-UX582LR-H901TS--1200x1200.jpg'),
  TapAdvicer('Experience with better design', 'images/top.png','ZedBook Duo','https://laptopsreviewer.com/wp-content/uploads/2020/10/asus-zenbook-duo-intel-core-i7-10510u-10th-gen-14-inch-fhd-thin-and-light-1-2048x1536.jpg'),
  TapAdvicer('Power with processor   Core i9 ','images/top.png','ZedBook Duo','https://laptopsreviewer.com/wp-content/uploads/2020/10/asus-zenbook-duo-intel-core-i7-10510u-10th-gen-14-inch-fhd-thin-and-light-1-2048x1536.jpg'),
];
Widget buildAdvicer(TapAdvicer tapAdvicer,context) => Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Container(
            width: double.infinity,
            //height: 300,
            decoration: BoxDecoration(
              color: HexColor('#07094D'),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(tapAdvicer.name,style: TextStyle(
                    color: HexColor('#898BDB'),
                    fontSize: 14
                  ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 70,
                    width: 250,
                    child: Text(
                      tapAdvicer.title,
                      style: const TextStyle(
                        color: Colors.white,
                      fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      gradient: LinearGradient(
                        colors: [
                          HexColor('##2B4A77'),
                          HexColor('##0038FF'),
                          HexColor('##FF7FFA'),
                          HexColor('#C0AE0B'),


                        ]
                      )
                    ),
                    width: 114,
                    height: 50,
                    child: MaterialButton(
                      onPressed:(){
                        navigateTo(context,ChatScreen());
                      },
                      child:const Text('Buy Now',style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right:-25,
          top:-20,
          child: Image(
            image:AssetImage(tapAdvicer.image),height:260),
        ),
      ],
    );