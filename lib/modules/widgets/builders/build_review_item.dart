import 'package:el_wekala/models/store_model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
Widget buildReviewItem(ReviewsItems reviewModel) => Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: 100,
          child: Row(
              children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(reviewModel.user!.profileImage!)),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reviewModel.user!.name!,
                              style:const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 80
                            ),
                            Text(
                              DateFormat('MM-dd-yyyy').format(
                                  DateTime.tryParse(reviewModel.createdAt!)!),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: 270,
                            child: Text(
                              reviewModel.comment!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.black38),
                            )),
                        Row(
                          children: [
                            const SizedBox(
                              width: 130,
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
                            Icon(
                              Icons.star,
                              color: HexColor('#07094D'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ])),
    );
