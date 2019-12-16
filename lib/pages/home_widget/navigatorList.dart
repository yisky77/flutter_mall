import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../routers/application.dart';
import 'package:fluro/fluro.dart';
//import '../category_screen.dart';

class TopNavigator extends StatelessWidget {
  final List navigatorList = [
    {'name':'联系客服','img': 'coupon.png','id':0},
    {'name':'订单','img': '02.gif','id':1},
    {'name':'人气推荐','img': 'new_nav_3.png','id':2},
    {'name':'品牌商','img': '04.gif','id':3},
    {'name':'专题精选','img': '3.png','id':4},
    {'name':'新品','img': '03.gif','id':5},
    {'name':'京东热销','img': 'jd.png','id':6},
    {'name':'淘宝','img': 'jd.png','id':7},
    {'name':'拼多多热销','img': 'pdd.png','id':8},
    {'name':'全部分类','img': '05.gif','id':9}
  ];
//  TopNavigator({Key key, this.navigatorList}) : super(key: key);
  Widget _gridViewItemUI(BuildContext context,item){
    return InkWell(
      onTap: () {
        int id = item['id'];
        switch (id) {
          case 0: _launchURL('tel:17688886201');break;
          case 1: return Application.router.navigateTo(context,"/hotGoodsPage", transition: TransitionType.cupertino);break;
          case 2: return Application.router.navigateTo(context,"/hotGoodsPage", transition: TransitionType.cupertino);break;
          case 3: return Application.router.navigateTo(context,"/brandGoodsPage", transition: TransitionType.cupertino);break;
          case 4: return Application.router.navigateTo(context,"/topicGoodsPage", transition: TransitionType.cupertino);break;
          case 5: return Application.router.navigateTo(context,"/newGoodsPage", transition: TransitionType.cupertino);break;
          case 6:  _launchURL('https://m.jd.com/');break;
          case 7:  _launchURL('https://h5.m.taobao.com/');break;
          case 8:  _launchURL('http://m.pinduoduo.com/');break;
          case 9: return Application.router.navigateTo(context,"/categoryPage", transition: TransitionType.cupertino);break;
//          case 9: Navigator.of(context).push(
//          cupertino右划返回操作
//            CupertinoPageRoute(builder: (BuildContext context){
//              return CategoryScreen();
//            })
//          );
        }

      },
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/temp/'+ item['img'],width:ScreenUtil().setWidth(80)),
          Text(
            item['name'],
            style: TextStyle(
              fontSize:14.0,
              color:Color.fromARGB(255, 0, 0, 0),
              height:2.0,
//              decoration:TextDecoration.underline,
              decorationStyle:TextDecorationStyle.solid,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(navigatorList.length>10){
      navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding:EdgeInsets.all(5.0),
      margin:EdgeInsets.all(5.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),//禁止回弹效果
        crossAxisCount: 5,
        crossAxisSpacing: 0.0,
//        mainAxisSpacing: 5.0,
        padding: EdgeInsets.all(0.0),
        children: navigatorList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }

//  拨打电话/用浏览器打开第三方网站
  void _launchURL(url) async {
//      print(item);
//    String url = 'tel:'+'17688886201';
//    String url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//  打开第三方app苹果地图
  _lanchApp() async {
    const url = "geo:31.2651321247,120.7324430486";
    const iosUrl = "http://maps.apple.com/?ll=31.2651321247,120.7324430486";
    if (await canLaunch(url)) {
      await launch(url);
    } else if (await canLaunch(iosUrl)) {
      await launch(iosUrl);
    }else{
      throw "不可以打开App";
    }
  }

  //发sms
  _lanchSms() async {
    final url = "sms:5550101234";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "不可sms";
    }
  }

  //发邮件
  _lanchEmail() async {
    final url = "mailto:smith@example.org?subject=News&body=New%20plugin";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "不可发邮件";
    }
  }
}