import 'package:flutter/material.dart';
//import '../model/detailsModel.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier{

  var goodsInfos = null;
  bool isLeft = true;
  bool isRight = false;
  String id = '';
  bool isCollect = false;
  var hotGoodsList = [];
  //从后台获取商品信息

  getGoodsInfo() async{
    var formData = { 'id':id };
    await request('get', 'GoodsDetail', formData:formData).then((val){
      goodsInfos= json.decode(val.toString());
//      print(goodsInfos['data']);
//      goodsInfos = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }
  //  收藏/取消商品
  collectGoodsid() async{
    var formData = {'type': 0, 'valueId': id };
    await request('POST', 'collect', formData: formData).then((val){
//      isCollect = json.decode(val.toString());
      isCollect = !isCollect;
      print('0000000');
      print(isCollect);
      notifyListeners();
    });
  }

  //改变tabBar的状态
  changeLeftAndRight(String changeState){
//    print(changeState);
//    if(changeState=='left'){
//      isLeft=true;
//      isRight=false;
//    }else{
//      isLeft=false;
//      isRight=true;
//    }
    notifyListeners();

  }

  sethotGoodsList(List hotGoodsLists) {
    hotGoodsList = hotGoodsLists;
    notifyListeners();
  }

  setProId(String ids) {
    id = ids;
    notifyListeners();
  }

  setIsCollect(int flag) {
    isCollect = flag == 0 ? false: true;
    notifyListeners();
  }

}