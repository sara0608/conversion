import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'expression.dart';

bool getDeviceYn = false;
int customerColor = 0;

class userSetting{

  getColor(){
    Color reCustomerColor = Color(customerColor);
    return reCustomerColor;
  }

  setColor(Color targetColor) async{
    // 01. 변수저장
    customerColor = targetColor.value;
    // 02. 디바이스에 변수 저장
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("customerColor", customerColor);
  }
}

getDeviceValue() async{
  // 01. 값 불러오기
  final prefs = await SharedPreferences.getInstance();
  int? _customerColor = prefs.getInt('customerColor');
  String? _customerExpression = prefs.getString('customerExpression');

  // 02. color 셋팅
  if (_customerColor == null){
    customerColor = 4283215696; //저장된 값이 없을시 기본값 저장
  }else{
    customerColor = _customerColor;
  }

  // 03. expression 셋팅
  if (_customerExpression == null){
    expression_target = 'Basic_001';
    expression_target_item = 'Basic_001_001';
  }else{
    expression_target = _customerExpression;
    expression_target_item = _customerExpression + "_001";
  }
}