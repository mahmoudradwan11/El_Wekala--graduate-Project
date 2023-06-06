import 'package:el_wekala/modules/screens/login.dart';
import 'package:el_wekala/modules/screens/register.dart';
import 'package:el_wekala/modules/widgets/builders/defaultBotton.dart';
import 'package:el_wekala/modules/widgets/functions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LayoutLoginAndRegister extends StatelessWidget {
  const LayoutLoginAndRegister({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:const [
                  SizedBox(height: 100,),
                  Image(image: AssetImage('images/El Wekala.png')),
                  SizedBox(height: 20,),
                  Image(image: AssetImage('images/lay.png')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DefaultButton(buttonWidget:const Text('Sign Up',style: TextStyle(color: Colors.white),),
                function:(){
                navigateTo(context, Register());
                },
                backgroundColor: HexColor('#07094D'),
                borderColor: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50,left: 10.0,right: 10.0,top: 10),
              child: DefaultButton(buttonWidget:Text('Log in',style: TextStyle(color: HexColor('#07094D')),), function:(){
                navigateTo(context, Login());
              },backgroundColor:Colors.white,
                borderColor: HexColor('#07094D'),),
            )

          ],
        ),
      ),
    );
  }
}
