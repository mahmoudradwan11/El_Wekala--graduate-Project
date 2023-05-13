import 'package:el_wekala/core/controllers/store_cubit/store_cubit.dart';
import 'package:el_wekala/models/store_model/favorite.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildFavoriteItem(FavoriteProducts favoriteProducts,context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 180,
          height: 180,
          //color: Colors.green,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: HexColor('#07094D'),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20))),
                        height: 125,
                        child: Center(
                          child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                favoriteProducts.status!,
                                style:const TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20)),
                              color: HexColor('#07094D').withOpacity(0.6),
                            ),
                            height: 125,
                            child: Padding(
                              padding:const EdgeInsets.only(right: 30, left: 10),
                              child: Image(
                                fit: BoxFit.contain,
                                image: NetworkImage(favoriteProducts.image!),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap:(){
                              ElWekalaCubit.get(context).deleteFavorite(favoriteProducts.sId);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                backgroundColor: HexColor('#BFC0E4'),
                                radius: 10,
                                child: const Icon(
                                  Icons.favorite,
                                  size: 15,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  favoriteProducts.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: HexColor('#C70000'),
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                                left: Radius.circular(20))),
                                    child: const Center(
                                        child: Text(
                                      '10% Off',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
                                    ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:const EdgeInsets.only(left: 10.0),
                              child: Text(
                                favoriteProducts.company!,
                                style:
                                    const TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ),
                          Padding(
                            padding:const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '\$${favoriteProducts.price!.round()}',
                              style:const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: HexColor('#07094D'),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      ElWekalaCubit.get(context).addToMyCart(favoriteProducts.sId!);
                                    },
                                    child: const Text(
                                      'Add to Cart',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
