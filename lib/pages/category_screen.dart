import 'package:flutter/material.dart';
import './category_widget/leftnav_category.dart';
//import '../service/service_method.dart';
import './category_widget/right_catedata.dart';
//import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import '../provide/category_info.dart';
import './common/loadingWidget.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final height = window.physicalSize.height; //获取手机屏幕高度
    return Scaffold(
        appBar:AppBar(
          title: Text('分类'),
          centerTitle:true,
        ),
        body:FutureBuilder(
//          future:request('get','CategoryIndexContent'),
          future:_getBackInfo(context),
          builder: (context,snapshot){
            if(snapshot.hasData){
//              var data = json.decode(snapshot.data.toString());
//              List<Map> leftnavDataList = (data['data']['categoryList'] as List).cast();
//              var picUrl = data['data']['currentCategory']['picUrl'];
//              List<Map> currentSubCategory = (data['data']['currentSubCategory'] as List).cast();
//              print('99999999');

              return SizedBox(
                  child: Container(
                  color: const Color(0xffffffff),//0x 后面开始 两位FF表示透明度16进制，或者Colors.white
                  child: Row(
                    children: <Widget>[
                      LeftnavData(),
                      new Container(
                          width: ScreenUtil().setWidth(570),
                          color: Color(0xfff8f8f8),
                          padding:EdgeInsets.only(left:10,top:0),
                          child: ListView(
                            children: <Widget>[
//                              Rightcatedata(currentSubCategory:currentSubCategory,picUrl:picUrl),   //
                              Rightcatedata(),   //
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              print('加载左侧分类出错');
              Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            } else {
              return LoadingDataWidget();
            }
          },
        ),
    );
  }

  Future _getBackInfo(BuildContext context )async{
    await  Provide.value<CategoryInfoProvide>(context).getCategoryleftInfo();
    return '完成加载';
  }

}