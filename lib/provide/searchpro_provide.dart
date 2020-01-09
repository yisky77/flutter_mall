import 'package:flutter/material.dart';
//import '../model/searchProModel.dart';
import '../service/service_method.dart';
import 'dart:convert';

class SearchProInfoProvide with ChangeNotifier{

  var searchProInfo = null;
  var searchProlistInfo = null;
  var hotGoodslistInfo = null;
  var newGoodslistInfo = null;
  List topicGoodslistInfo = null;
  var brandGoodslistInfo = null;
  bool noMoreTopicData = false;
  int currentPage = 1;

  //获取指定二级分类id的商品列表
  getSearchProInfos(int currentPage, String id ) async{
    var formData = { 'page': currentPage, 'categoryId':id , 'limit':10 };
    await request('get', 'searchgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString());
      print(responseData);
      searchProInfo = responseData;
      notifyListeners();
    });
  }

  //获取搜索关键词商品列表
  getSearchNameInfos(String keyword, int currentPage) async{
    var formData = {'keyword': keyword, 'page': currentPage, 'limit':10, 'sort': 'name', 'order': 'asc', 'categoryId': 0 };
    await request('get', 'searchgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString());
      searchProlistInfo = responseData;
      notifyListeners();
    });
  }

  //获取人气推荐商品列表
  getHotGoodsInfos(int currentPage, bool isloadmore) async{
    print(currentPage);
    var formData = {'isHot': true, 'page': currentPage, 'limit':10, 'sort': 'add_time', 'order': 'desc', 'categoryId': 0 };
    await request('get', 'searchgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString())['data'];
      List listdata = (responseData['list'] as List).cast();
      print(listdata);
      print(listdata.length);
      if(isloadmore && listdata.length>0) {
        hotGoodslistInfo.addAll(listdata);
      } else {
        hotGoodslistInfo = listdata;
      }
//      如果是最后一页
      if(responseData['page'] >= responseData['pages']) noMoreTopicData = true;
      else noMoreTopicData = false;
      notifyListeners();
    });
  }

  //获取新品首发商品列表
  getNewGoodsInfos(responseData) async{
    var formData = {'isNew': true, 'page': currentPage, 'limit':10, 'sort': 'add_time', 'order': 'desc', 'categoryId': 0 };
    await request('get', 'searchgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString());
      newGoodslistInfo = responseData;
      notifyListeners();
    });
  }

  //获取专题精选商品列表
  getTopicGoodsInfos(int currentPage,bool isloadmore) async{
    var formData = {'page': currentPage, 'limit':10 };
    await request('get', 'Topicgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString())['data'];
      List listdata = (responseData['list'] as List).cast();
      if(isloadmore && listdata.length>0) {
        topicGoodslistInfo.addAll(listdata);
      } else {
        topicGoodslistInfo = listdata;
      }
//      如果是最后一页
      if(responseData['page'] >= responseData['pages']) noMoreTopicData = true;
      else noMoreTopicData = false;
      return noMoreTopicData;
      notifyListeners();
    });
  }

  //获取品牌商列表
  getBrandGoodsInfos(int currentPage,bool isloadmore) async{
    var formData = {'page': currentPage, 'limit':10 };
    await request('get', 'Brandgoodslist', formData: formData ).then((val){
      var responseData = json.decode(val.toString())['data'];
      List listdata = (responseData['list'] as List).cast();
      if(isloadmore && listdata.length>0) {
        brandGoodslistInfo.addAll(listdata);
      } else {
        brandGoodslistInfo = listdata;
      }
//      如果是最后一页
      if(responseData['page'] >= responseData['pages']) noMoreTopicData = true;
      else noMoreTopicData = false;
      notifyListeners();
    });
  }

  //改变当前页码
  changeCategoryCurrentIndex(int index){
    currentPage = index;
    notifyListeners();
  }
}