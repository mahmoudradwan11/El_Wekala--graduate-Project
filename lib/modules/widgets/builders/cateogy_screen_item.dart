import 'package:flutter/material.dart';

Widget buildCategoryScreenItem(String text)=>Padding(
  padding: const EdgeInsets.all(10.0),
  child: Container(
      height:52,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child:Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text(text,style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
            const Spacer(),
            const Text('10 products',style: TextStyle(color: Colors.grey),),
            const SizedBox(width: 20,),
            Container(
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              height: 100,
              width: 50,
              child:const Center(
                  child: Icon(Icons.arrow_forward_ios)),
            )
          ],
        ),
      )
  ),
);