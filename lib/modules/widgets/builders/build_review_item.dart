import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/models/store_model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
Widget buildReviewItem(ReviewsItems reviewModel,context,id) => Card(
    margin: const EdgeInsets.symmetric(horizontal: 0.8),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 0.0,
    child: Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(reviewModel.user!.profileImage!),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(
                        '${reviewModel.user!.name}',
                        style: const TextStyle(
                          height: 1.4,
                            fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      const Spacer(),
                      Text(
                        DateFormat('dd-MM-yyyy').format(
                            DateTime.tryParse(reviewModel.createdAt!)!),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height:5,),
                  Text(
                    reviewModel.comment!,style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.black38),),
                  if(reviewModel.rating==5)
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Row(
                      children:[
                        const Spacer(),
                        Icon(
                          Icons.star,
                          color: HexColor('#07094D'),
                        ),
                        Icon(
                          Icons.star,
                          color: HexColor('#07094D'),
                        ),
                        Icon(
                          Icons.star,
                          color: HexColor('#07094D'),
                        ),
                        Icon(
                          Icons.star,
                          color: HexColor('#07094D'),
                        ),
                        Icon(
                          Icons.star,
                          color: HexColor('#07094D'),
                        ),
                      ],
                    ),
                  ),
                  if(reviewModel.rating < 5 && reviewModel.rating >= 4)
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Row(
                        children:[
                          const Spacer(),
                          Icon(
                            Icons.star,
                            color: HexColor('#07094D'),
                          ),
                          Icon(
                            Icons.star,
                            color: HexColor('#07094D'),
                          ),
                          Icon(
                            Icons.star,
                            color: HexColor('#07094D'),
                          ),
                          Icon(
                            Icons.star,
                            color: HexColor('#07094D'),
                          ),
                        ],
                      ),
                    ),
                  if(reviewModel.rating < 4 && reviewModel.rating >= 3)
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Row(
                        children:[
                          const Spacer(),
                          Icon(
                            Icons.star,
                            color: HexColor('#07094D'),
                          ),
                          Icon(
                            Icons.star,
                            color: HexColor('#07094D'),
                          ),
                          Icon(
                            Icons.star,
                            color: HexColor('#07094D'),
                          ),
                        ],
                      ),
                    ),
                  if(reviewModel.rating < 3 && reviewModel.rating >= 2)
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Row(
                        children:[
                          const Spacer(),
                          Icon(
                            Icons.star,
                            color: HexColor('#07094D'),
                          ),
                          Icon(
                            Icons.star,
                            color: HexColor('#07094D'),
                          ),
                        ],
                      ),
                    ),
                  if(reviewModel.rating < 2 && reviewModel.rating >= 1)
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Row(
                        children:[
                          const Spacer(),
                          Icon(
                            Icons.star,
                            color: HexColor('#07094D'),
                          ),
                        ],
                      ),
                    ),
                  if(reviewModel.user!.name==ElWekalaCubit.get(context).profileModel!.user!.name!)
                     Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child:IconButton(
                      onPressed:(){
                        ElWekalaCubit.get(context).deleteReview(reviewModel.sId,id);
                      },
                      icon:const Icon(Icons.delete),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    ));
