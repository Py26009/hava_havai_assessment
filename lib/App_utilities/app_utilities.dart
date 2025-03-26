import 'package:flutter/material.dart';

class AppColors{
  Color bgColor = Color(0xffFFE3E4);
  Color buttonColor = Color(0xffFF660E);
  Color addItemColor = Color(0xffF4F4F1);
}

 TextStyle mTextStyle18({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.bold }){
    return TextStyle(
      color: mColor,
      fontSize: 18,
      fontWeight: mFontWeight
    );
 }

TextStyle mTextStyle22({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal }){
  return TextStyle(
      color: mColor,
      fontSize: 22,
      fontWeight: mFontWeight
  );
}

TextStyle mTextStyle14({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.normal }){
  return TextStyle(
      color: mColor,
      fontSize: 14,
      fontWeight: mFontWeight
  );
}

TextStyle mTextStyle32({Color mColor = Colors.black, FontWeight mFontWeight = FontWeight.bold }){
  return TextStyle(
      color: mColor,
      fontSize: 32,
      fontWeight: mFontWeight
  );
}