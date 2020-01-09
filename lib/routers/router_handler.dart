import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page/detailpage.dart';
import '../pages/category_screen.dart';
//import '../pages/searchpro/search_pro.dart';
import '../pages/home_screen.dart';
import '../pages/login_screen.dart';
import '../pages/home_widget/home_detail_page/hotGoodsPage.dart';
import '../pages/home_widget/home_detail_page/newGoodsPage.dart';
import '../pages/home_widget/home_detail_page/brandGoodsPage.dart';
import '../pages/home_widget/home_detail_page/topicGoodsPage.dart';
import '../pages/person_widget/order/order.dart';

Handler detailsHandler =Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
      String goodsId = params['id'].first;
//      print('index>details goodsID is ${goodsId}');
      return DetailsPage(goodsId);

    }
);

Handler homePageHandler =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return HomePage();
  }
);

Handler LoginPageHandler =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return LoginPage();
  }
);

Handler categoryPageHandler =Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
      return CategoryScreen();
    }
);

//Handler searchproPageHandler =Handler(
//    handlerFunc: (BuildContext context,Map<String,List<String>> params){
//      String data = params['data'][0];
//      return SearchProlist(data);
//    }
//);

Handler hotGoodsPageHandler =Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
      return HotGoodsPage();
    }
);

Handler newGoodsPageHandler =Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
      return NewGoodsPage();
    }
);

Handler TopicGoodsPageHandler =Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
      return TopicGoodsPage();
    }
);

Handler BrandGoodsPageHandler =Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
      return BrandGoodsPage();
    }
);

//Handler myorderPageHandler =Handler(
//    handlerFunc: (BuildContext context,Map<String,List<String>> params){
//      return KeepAliveDemo();
//    }
//);