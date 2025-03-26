import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hava_havai_assessment/App_utilities/app_utilities.dart';
import 'package:hava_havai_assessment/Screens/Catalogue%20Page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   Timer(Duration(seconds: 3),(){

      Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CataloguePage()));

    });

    return Scaffold(
       backgroundColor: AppColors().bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child:  Text("LET's \n      SHOP", style: mTextStyle32(),),)
        ],
      ),
    );

  }
}
