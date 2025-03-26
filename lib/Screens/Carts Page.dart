import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hava_havai_assessment/App_utilities/app_utilities.dart';
import 'package:hava_havai_assessment/Bloc/AddToCartBloc/add%20cart%20bloc.dart';
import 'package:hava_havai_assessment/Bloc/AddToCartBloc/add%20cart%20event.dart';
import 'package:hava_havai_assessment/Bloc/AddToCartBloc/add%20cart%20state.dart';
import 'package:hava_havai_assessment/Models/Products%20Model.dart';
import 'package:hava_havai_assessment/Screens/finalPage.dart';

class CartsPage extends StatefulWidget {
  @override
  State<CartsPage> createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
  Map<int, int> quantityMap = {};
  num totalPrice = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: AppColors().bgColor,
        appBar: AppBar(
          backgroundColor: AppColors().bgColor,
          title: Center(child: Text("Carts", style: mTextStyle22(),)),
        ),
        body: Column(
            children: [
              Expanded(
                child: BlocBuilder<CartBloc, CartState>(builder: (_, state) {
                  if (state is CartLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CartUpdatedState) {
                    final cartItems = state.cartItems;
                    return cartItems.isEmpty ? Center(
                      child: Text("Your Cart is empty"),) :
                    ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (_, index) {
                          final product = cartItems[index];
                          if (!quantityMap.containsKey(product.id)) {
                            quantityMap[product.id] = 1;
                          }
                          num amount = (product.price.toDouble())*(quantityMap[product.id]!);
                         totalPrice = amount;
                          num a = (product.price.toDouble()) * 100;
                          num b = 100 - (product.discountPercentage.toDouble());
                          num c = a / b;
                          String price = c.toStringAsFixed(2);
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10,),
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              product.thumbnail),
                                          fit: BoxFit.fill),
                                      color: Colors.grey.shade100
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 2.0),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(product.title,
                                                  style: mTextStyle14(
                                                      mFontWeight: FontWeight
                                                          .bold),),
                                                IconButton(onPressed: (){
                                                  BlocProvider.of<CartBloc>(context).add(RemoveFromCartEvent(product));
                                                }, icon: Icon(Icons.delete,
                                                  color: Color(0xffFF660E),))
                                              ]
                                          ),
                                        ),
                                        Text(product.brand,
                                          style: mTextStyle14(),),
                                      //  SizedBox(height: 5,),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                right: 10.0),
                                            child: Row(
                                              children: [
                                                Text("Rs.", style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough)),
                                                Text("$price", style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough),),
                                                Text(
                                                  " Rs.", style: mTextStyle14(
                                                    mFontWeight: FontWeight
                                                        .bold),),
                                                Text(product.price.toString(),
                                                    style: mTextStyle14(
                                                        mFontWeight: FontWeight
                                                            .bold)),
                                                SizedBox(width: 70,),
                                                Container(
                                                  width: 65,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(16),
                                                      color: Colors.grey
                                                          .shade200
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              if (quantityMap.containsKey(product.id) && quantityMap[product.id]! > 1) {
                                                                quantityMap[product.id] = quantityMap[product.id]! - 1;
                                                              }
                                                            });
                                                          },
                                                          child: Text("-")),
                                                      Text(
                                                          "${quantityMap[product
                                                              .id] ?? 1}"),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              quantityMap[product.id] =
                                                                  (quantityMap[product
                                                                      .id] ??
                                                                      1) + 1;
                                                            });
                                                          },
                                                          child: Text("+"))
                                                    ],
                                                  ),
                                                ),
                                              ],)
                                        ),
                                        SizedBox(height: 2,),
                                        Row(
                                          children: [
                                            Text(
                                              product.discountPercentage.toString(),
                                              style: mTextStyle14(
                                                  mColor: Colors.red),),
                                            Text("% OFF", style: mTextStyle14(
                                                mColor: Colors.red))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),),
                              ],),
                          );
                        });
                  } else {
                    return Container();
                  }
                }),
              ),
              SizedBox(height: 20,),
              SizedBox(height: 75,
                child: Container(
                  margin: EdgeInsets.only(bottom: 21),
                  height: 50,
                  width: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xffFF660E)
                  ),
                  child: InkWell(
                      onTap: () {
                        final state = context
                            .read<CartBloc>()
                            .state;
                        if (state is CartUpdatedState &&
                            state.cartItems.isNotEmpty) {
                          num totalCartPrice = getTotalPrice(
                              state.cartItems.map((product)=>CartItem(id: product.id, price: product.price.toDouble())).toList()); // Get total price
                          int totalCartQuantity = getTotalQuantity(
                              state.cartItems.map((product)=>CartItem(id: product.id, price: product.price.toDouble())).toList()); // Get total quantity
                          String totalPriceString = totalCartPrice
                              .toStringAsFixed(2);

                          showModalBottomSheet(
                              context: context, builder: (context) {
                            return Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white
                                ),
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0),
                                          child: Text("Total Price",
                                            style: mTextStyle18(),),
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          children: [
                                            Text("Rs.", style: mTextStyle22(),),
                                            Text("$totalPriceString",
                                              style: mTextStyle22(),),
                                            SizedBox(width: 120,),
                                            InkWell(onTap: (){
                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>finalPage()));
                                            },
                                              child: Container(
                                                height: 60,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .circular(22),
                                                    color: AppColors().buttonColor
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceEvenly,
                                                  children: [
                                                    Text("Check Out",
                                                      style: mTextStyle18(
                                                          mFontWeight: FontWeight
                                                              .bold,
                                                          mColor: Colors.white),),
                                                    Container(
                                                      height: 25,
                                                      width: 25,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(14),
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(child: Text(
                                                        "$totalCartQuantity",
                                                        style: mTextStyle18(
                                                            mFontWeight: FontWeight
                                                                .bold,
                                                            mColor: Color(
                                                                0xffFF660E)),)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                )
                            );
                          }
                          );
                        };
                      },
                    child: Center(child: Text("Place Order", style: mTextStyle22(mColor: Colors.white, mFontWeight: FontWeight.bold)))),
                  ),
                ),
            ]
        )
    );
  }

   num getTotalPrice(List<CartItem> cartItems) {
     num total = 0;
    for (var product in cartItems) {
      int quantity = quantityMap[product.id] ?? 1;
      total += product.price.toDouble() * quantity;
     }
    return total;
   }


  int getTotalQuantity(List<CartItem> cartItems) {
    int totalQuantity = 0;
    for (var product in cartItems) {
      totalQuantity += quantityMap[product.id] ?? 1; // Default quantity is 1
    }
    return totalQuantity;
  }
}


class CartItem {
  final int id;
  final double price;

  CartItem({required this.id, required this.price});
}


