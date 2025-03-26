import 'package:flutter/material.dart';
import 'package:hava_havai_assessment/App_utilities/app_utilities.dart';
import 'package:lottie/lottie.dart';

class finalPage extends StatelessWidget {
  const finalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().bgColor,
      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 200,
                    width: 200,
                    child: Lottie.asset("Assets/lottie/checkOutSuccesful.json",)),
              ),
              Center(child: Text("Order Placed Successfully", style: mTextStyle22(mFontWeight: FontWeight.bold),))
            ],
          ),

      
    );
  }
}
