import 'package:flutter/material.dart';
import 'body.dart';

Color customerColor = Colors.deepOrange;

class userSetting{

  getColor(){
    return customerColor;
  }

  setColor(Color targetColor){
    customerColor = targetColor;
  }
}