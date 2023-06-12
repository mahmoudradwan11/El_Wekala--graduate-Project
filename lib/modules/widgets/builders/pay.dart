import 'package:flutter/material.dart';
Widget buildPayment(context)=>Padding(
  padding: const EdgeInsets.only(left: 20,right: 20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:const [
       Text('Payment settings',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
       Image(image: NetworkImage('https://applynowcredit.com/wp-content/uploads/2020/09/Classic-Card-with-chip.png')),
       Text('Payment Method',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black)
  ),
      SizedBox(
        height: 10,
      ),
       Image(image: AssetImage('images/ot.png')),
       SizedBox(
        height: 10,
      ),
      Image(image: AssetImage('images/pal.png')),
      SizedBox(
        height: 10,
      ),
      Image(image: AssetImage('images/mast.png')),
      SizedBox(
        height: 10,
      ),
  ]
  )
);