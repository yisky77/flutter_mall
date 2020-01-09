import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:provider/provider.dart';
import '../provide/details_info.dart';
import './home_widget/navigatorList.dart';
import './home_widget/swiperList.dart';
import './home_widget/brandList.dart';
import './home_widget/topic.dart';
import './home_widget/newGoodsList.dart';
import './home_widget/hotGoodsList.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import './common/loadingWidget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './common/sharePage.dart';

class HomePage extends StatelessWidget{

//class HomePage extends StatefulWidget {
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin  {
//  @override
//  bool get wantKeepAlive =>true;
//  @override
//  void initState() {
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
            title: Text('新巢蜜商城'),
//          title: Container(
//            margin: EdgeInsets.fromLTRB(10,0,0,0),
//            padding: EdgeInsets.fromLTRB(15,0,0,0),
//            decoration: BoxDecoration(color: Color(0xffeeeeee),borderRadius: BorderRadius.circular(50)),
//              child: TextField(
//                decoration: InputDecoration(
//                  hintText: '输入商品名称查询',
//                  border: InputBorder.none,
//                  icon: Icon(Icons.search,color:Colors.black)
//                )
//              ),
//          ),
          actions:<Widget>[
            IconButton(icon:Icon(Icons.share), onPressed: (){
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
//                  return GestureDetector(
//                    child: SharePage(),
//                  );
                  return SharePage();
                },
              );
            }),
          ],
          centerTitle: true,
        ),
        body:FutureBuilder(
          future:request('get','homeBanner'),
          builder: (context,snapshot){
            switch(snapshot.connectionState) {
              case ConnectionState.none: return LoadingDataWidget();
              case ConnectionState.active: return LoadingDataWidget();
              case ConnectionState.waiting: return LoadingDataWidget();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var data = json.decode(snapshot.data.toString()); //把json数据转换成map数据
                  List<Map> swiperDataList = (data['data']['banner'] as List).cast();
                  List<Map> brandList = (data['data']['brandList'] as List).cast();
                  List<Map> topicList = (data['data']['topicList'] as List).cast();
                  List<Map> newGoodsList = (data['data']['newGoodsList'] as List).cast();
                  List<Map> hotGoodsList = (data['data']['hotGoodsList'] as List).cast();
                  DetailsInfoProvide DetailsInfo = Provider.of<DetailsInfoProvide>(context);
                  DetailsInfo.sethotGoodsList(hotGoodsList);
                  return SingleChildScrollView(
                    child: new Container(
                      color: const Color(0xffffffff),
                      //0x 后面开始 两位FF表示透明度16进制，或者Colors.white
                      child: Column(
                        children: <Widget>[
                          SwiperDiy(swiperDataList: swiperDataList),
                          //页面顶部轮播组件
                          TopNavigator(),
                          //新品首发组件
                          Brand(brandList: brandList),
//                          //品牌制造商直供组件
                          Topic(topicList: topicList),
                          NewGoods(newGoodsList: newGoodsList),
                          //专题精选组件
                          HotGoods(hotGoodsList),
                          //人气推荐组件
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                      msg: "加载主页失败",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Color.fromARGB(100,0,0,0),
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                } else {
                  Fluttertoast.showToast(
                      msg: "加载中",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Color.fromARGB(100,0,0,0),
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  return LoadingDataWidget();
                }
            }
          },
        )
    );

  }
}