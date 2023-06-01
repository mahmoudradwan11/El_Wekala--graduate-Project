import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
Widget buildPayment(context)=>Padding(
  padding: const EdgeInsets.only(left: 20,right: 20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      const Text('Payment settings',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
      const Image(image: NetworkImage('https://applynowcredit.com/wp-content/uploads/2020/09/Classic-Card-with-chip.png')),
      const Text('Payment Method',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black)
  ),
      const SizedBox(
        height: 10,
      ),
      const Image(image: AssetImage('images/ot.png')),
      const SizedBox(
        height: 50,
      ),
      Align(
        alignment: Alignment.center,
          child: Text('Support By Paymob',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: HexColor('#07094D')))),
      const Align(
          alignment: Alignment.center,
          child: Text('Do Your Transaction Safety',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,color: Colors.black)))
  ]
  )
);