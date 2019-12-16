import 'package:flutter/material.dart';
//import '../model/searchProModel.dart';
import '../service/service_method.dart';
import 'dart:convert';

class SearchProInfoProvide with ChangeNotifier{

  var searchProInfo ;
  var searchProlistInfo;
  var hotGoodslistInfo;
  var newGoodslistInfo;
  var topicGoodslistInfo;
  var brandGoodslistInfo;
  int currentPage = 1;

  //获取指定二级分类id的商品列表
  getSearchProInfos(int currentPage, String id) async{
    var formData = { 'page': currentPage, 'categoryId':id , 'limit':10 };
//    print(id);
    await request('get', 'searchgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString());
      print(responseData);
      searchProInfo = responseData;
//       categoryleftInfo = responseData['data'];
//       categoryidInfo = categoryleftInfo['currentSubCategory'];
//       picurl = categoryleftInfo.currentCategory.picurl;
//      print(categoryleftInfo.currentCategory);
//      SearchProInfo = SearchProModel.fromJson(responseData);
//      print('222222');
//      print(SearchProInfo);
      notifyListeners();
    });
  }

  //获取搜索关键词商品列表
  getSearchNameInfos(String keyword, int currentPage) async{
    var formData = {'keyword': keyword, 'page': currentPage, 'limit':10, 'sort': 'name', 'order': 'asc', 'categoryId': 0 };
    await request('get', 'searchgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString());
//      print(responseData);
      searchProlistInfo = responseData;
//       categoryleftInfo = responseData['data'];
//       categoryidInfo = categoryleftInfo['currentSubCategory'];
//       picurl = categoryleftInfo.currentCategory.picurl;
//      print(categoryleftInfo.currentCategory);
//      SearchProlistInfo = SearchProModel.fromJson(responseData);
//      print('888888888');
//      print(SearchProlistInfo);
      notifyListeners();
    });
  }

  //获取人气推荐商品列表
  getHotGoodsInfos(int currentPage) async{
    var formData = {'isHot': true, 'page': currentPage, 'limit':10, 'sort': 'add_time', 'order': 'desc', 'categoryId': 0 };
    await request('get', 'searchgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString());
      hotGoodslistInfo = responseData;
      notifyListeners();
    });
  }

  //获取新品首发商品列表
  getNewGoodsInfos(int currentPage) async{
    var formData = {'isNew': true, 'page': currentPage, 'limit':10, 'sort': 'add_time', 'order': 'desc', 'categoryId': 0 };
    await request('get', 'searchgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString());
      newGoodslistInfo = responseData;
      notifyListeners();
    });
  }

  //获取专题精选商品列表
  getTopicGoodsInfos(int currentPage) async{
    var formData = {'page': currentPage, 'limit':10 };
    await request('get', 'Topicgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString());
      topicGoodslistInfo = responseData;
      notifyListeners();
    });
  }

  //获取品牌商列表
  getBrandGoodsInfos(int currentPage) async{
    var formData = {'page': currentPage, 'limit':10 };
    await request('get', 'Brandgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString());
      brandGoodslistInfo = responseData;
      notifyListeners();
    });
  }

  //改变当前页码
  changeCategoryCurrentIndex(int index){
    currentPage = index;
    notifyListeners();
  }
}