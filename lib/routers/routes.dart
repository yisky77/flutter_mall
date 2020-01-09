import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes{
  static String home='/home';
  static String detailsPage = '/detail';
  static String loginPage = '/login';
  static String categoryPage = '/categoryPage';
//  static String searchproPage = '/searchprolist/:data';
  static String hotGoodsPage = '/hotGoodsPage';
  static String newGoodsPage = '/newGoodsPage';
  static String topicGoodsPage = '/topicGoodsPage';
  static String brandGoodsPage = '/brandGoodsPage';
//  static String myorderPage = '/myorder';
  static void configureRoutes(Router router){
    router.notFoundHandler= new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
      }
    );

    router.define(home,handler:homePageHandler);
    router.define(loginPage,handler:LoginPageHandler);
    router.define(detailsPage,handler:detailsHandler);
    router.define(categoryPage,handler:categoryPageHandler);
//    router.define(searchproPage,handler:searchproPageHandler);
    router.define(hotGoodsPage,handler:hotGoodsPageHandler);
    router.define(newGoodsPage,handler:newGoodsPageHandler);
    router.define(topicGoodsPage,handler:TopicGoodsPageHandler);
    router.define(brandGoodsPage,handler:BrandGoodsPageHandler);
//    router.define(myorderPage,handler:myorderPageHandler);
  }

}