import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';

class CartProvide with ChangeNotifier{
  List cartList = null;

  //从后台获取左侧分类信息
  getCartList() async{
    await request('get', 'cartlist').then((val){
//      cartList = json.decode(val.toString());
      cartList = [];
//      print(categoryleftInfo);
      notifyListeners();
    });
  }

}