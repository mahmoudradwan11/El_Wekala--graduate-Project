import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class Cate{
  String title;
  int index;
  String image;
  Cate(this.title,this.index,this.image);
}
List<Cate>cate = [
  Cate('Laptop', 0,'images/lap_cate.png'),
  Cate('Smart phone', 1 ,'images/phone.png'),
  Cate('Smart watch', 2,'images/sma.png'),
  Cate('Smart Tvs',3,'images/tvs.png'),
  Cate('Accessories',4,'images/acc.png'),
];
Widget buildCateItem(Cate cate,index,context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child:   InkWell(
    onTap:(){
      ElWekalaCubit.get(context).changeCate(index);
    },
    child: Container(
      decoration: BoxDecoration(
        gradient:ElWekalaCubit.get(context).chooseColor(index),
        borderRadius: BorderRadius.circular(12)
      ),
      width:200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                color:ElWekalaCubit.get(context).categoryIndex==index?HexColor('#6365A4'):Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image(image:AssetImage(cate.image),height: 50,width: 50,fit: BoxFit.contain,),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(cate.title,style: TextStyle(color:ElWekalaCubit.get(context).categoryIndex==index?Colors.white:Colors.black,fontSize: 15)),
                    const SizedBox(
                      height: 3,
                    ),
                    Text('100 product',style: TextStyle(color:ElWekalaCubit.get(context).categoryIndex==index?HexColor('#898BDB'):HexColor('#5C5C5D'),),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  ),
);