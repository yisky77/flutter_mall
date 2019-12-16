import 'package:flutter/material.dart';
import '../service/service_method.dart';
import './home_widget/navigatorList.dart';
import './home_widget/swiperList.dart';
import './home_widget/brandList.dart';
import './home_widget/topic.dart';
import './home_widget/newGoodsList.dart';
import './home_widget/hotGoodsList.dart';
import 'dart:convert';
//import 'package:fluttertoast/fluttertoast.dart';
import './common/loadingWidget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin  {
  @override
  bool get wantKeepAlive =>true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('家居热卖'),
          centerTitle: true,
//          actions: <Widget>[
//            IconButton(icon: Icon(Icons.add), onPressed: () {}),
//            IconButton(icon: Icon(Icons.dashboard), onPressed: () {}),
//            IconButton(icon: Icon(Icons.cached), onPressed: () {}),
//          ],
        ),
        body:FutureBuilder(
          future:request('get','homeBanner'),
//          future:request('post','homeBannerContext', formData: {'pageSize':10,'currentPage':1,'isBanner':1}),
//          future:request('post','homePageContext', formData: formdata),
          builder: (context,snapshot){
            switch(snapshot.connectionState) {
              case ConnectionState.none: return LoadingDataWidget();
              case ConnectionState.active: return LoadingDataWidget();
              case ConnectionState.waiting: return LoadingDataWidget();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var data = json.decode(snapshot.data.toString()); //把json数据转换成map数据
//              print(data);
                  List<Map> swiperDataList = (data['data']['banner'] as List).cast();
//              List<Map> swiperDataList = (data['data']['records'] as List).cast();
//              List<Map> swiperDataList = (data['data']['slides'] as List).cast();
                  List<Map> brandList = (data['data']['brandList'] as List).cast();
                  List<Map> topicList = (data['data']['topicList'] as List).cast();
                  List<Map> newGoodsList = (data['data']['newGoodsList'] as List).cast();
                  List<Map> hotGoodsList = (data['data']['hotGoodsList'] as List).cast();
//              print('9999');
                  return SingleChildScrollView(
                    child: new Container(
                      color: const Color(0xffffffff),
                      //0x 后面开始 两位FF表示透明度16进制，或者Colors.white
                      child: Column(
                        children: <Widget>[
                          if(swiperDataList.length > 0) SwiperDiy(swiperDataList: swiperDataList),
                          //页面顶部轮播组件
                          TopNavigator(),
                          //新品首发组件
                          if(brandList.length > 0) Brand(brandList: brandList),
                          //品牌制造商直供组件
                          if(topicList.length > 0) Topic(topicList: topicList),
                          if(newGoodsList.length > 0) NewGoods(newGoodsList: newGoodsList),
                          //专题精选组件
                          if(hotGoodsList.length > 0) HotGoods(hotGoodsList),
                          //人气推荐组件
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  print('加载出错');
                } else {
//              print('加载中');
//              Fluttertoast.showToast(
//                  msg: "加载中",
//                  toastLength: Toast.LENGTH_SHORT,
//                  gravity: ToastGravity.CENTER,
//                  timeInSecForIos: 1,
//                  backgroundColor: Colors.red,
//                  textColor: Colors.white,
//                  fontSize: 16.0
//              );
                  return LoadingDataWidget();
                }
            }
          },
        )
    );

  }
}