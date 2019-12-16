import 'package:flutter/material.dart';
//import '../model/CategoryLeftInfoModel.dart';
//import '../model/CategoryRightInfoModel.dart';
import '../service/service_method.dart';
import 'dart:convert';

class CategoryInfoProvide with ChangeNotifier{

  var categoryleftInfo;
  var categoryidInfo;
//  String picurl = null;
  bool isLeft = true;
  bool isRight = false;
  int currentIndex = 0;

  //从后台获取左侧分类信息
  getCategoryleftInfo() async{
    await request('get', 'CategoryIndexContent').then((val){
      categoryleftInfo = json.decode(val.toString())['data'];
      categoryidInfo = categoryleftInfo['currentSubCategory'];
//       picurl = categoryleftInfo.currentCategory.picurl;
//      print(categoryleftInfo.currentCategory);
//      categoryleftInfo = CategoryLeftInfoModel.fromJson(responseData);
//      print(categoryleftInfo.data);
      notifyListeners();
    });
  }

//  getCategoryleftInfo() async{
//    var formData = { 'currentPage':1, 'pageSize':10, 'status':1 };
//    await request('post', 'articleTypelist', formData: formData).then((val){
//      print('66666666677');
//      var responseData= json.decode(val.toString());
////      print(responseData['data']);
////      categoryleftInfo = responseData;
//      categoryleftInfo = CategoryLeftInfoModel.fromJson(responseData);
//      print(categoryleftInfo);
//      notifyListeners();
//    });
//  }

  //从后台获取对饮分类id信息
  getCategoryIdInfo(int id ) async{
    var formData = { 'id':id, };
    await request('get', 'CategoryidContent', formData: formData).then((val){
      var data = json.decode(val.toString())['data'];
      categoryidInfo= data['currentSubCategory'];
//      picurl = data.currentCategory.picurl;
      print(categoryidInfo);
//      categoryidInfo = CategoryRightInfoModel.fromJson(responseData);
      notifyListeners();
    });
  }

  //改变tabBar的状态
  changeLeftAndRight(String changeState){
    if(changeState=='left'){
      isLeft=true;
      isRight=false;
    }else{
      isLeft=false;
      isRight=true;
    }
    notifyListeners();
  }

  //改变左侧分类当前选中index
  changeCategoryCurrentIndex(int index){
    currentIndex = index;
    notifyListeners();
  }


}