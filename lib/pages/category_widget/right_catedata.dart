import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/category_info.dart';
import 'package:provide/provide.dart';
import '../../routers/application.dart';
import '../common/emptydata.dart';
import '../common/loadingWidget.dart';
import 'dart:convert';

// 分类右边数据显示
class Rightcatedata extends StatelessWidget {
  List currentSubCategory;
  String picUrl = 'http://yanxuan.nosdn.127.net/e8bf0cf08cf7eda21606ab191762e35c.png';
//  Rightcatedata({this.currentSubCategory,this.picUrl});

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryInfoProvide>(
        builder:(context,child,val) {
          var data = Provide.value<CategoryInfoProvide>(context).categoryidInfo;;
          currentSubCategory = data;
//          picUrl = data.picurl;
//          print(currentSubCategory);
          if (currentSubCategory != null) {
            return Container(
//              height: ScreenUtil().setHeight(200),
                width: ScreenUtil().setWidth(560),
                child: Column(
                  children: <Widget>[
                    new Image.network(picUrl, width: ScreenUtil().setWidth(560),
                        height: ScreenUtil().setHeight(192),
                        fit: BoxFit.fill), //
                    _wrapList(context)
                  ],
                )
            );
          } else {
            return LoadingDataWidget();
          }
       }
    );
  }

  //人气推荐内容渲染
  Widget _wrapList(context){
    if(currentSubCategory.length!=0){
      List<Widget> listWidget = currentSubCategory.map((val){
        return InkWell(
            onTap:(){print('点击了人气商品');
//              var data = {
//                'id': val['id'], 'name': val['name']
//              };
//            Application.router.navigateTo(context,"/searchprolist?id=${val['id']}",transition: TransitionType.inFromRight);
            Application.router.navigateTo(context,"/searchprolist/${val['id']}", transition: TransitionType.cupertino);
            },
            child: Container(
              width: ScreenUtil().setWidth(183),
              padding: EdgeInsets.all(5.0),
//              margin:EdgeInsets.only(bottom:0.5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(right: BorderSide(color: Color(0xfff5f5f5),width: 1),
                  bottom: BorderSide(color: Color(0xfff5f5f5),width: 1))
              ),
              child: Column(
                children: <Widget>[
                  Image.network(val['picUrl'],width: ScreenUtil().setWidth(183),height: ScreenUtil().setHeight(114),fit: BoxFit.fill),
                  Text(
                    val['name'],
                    maxLines: 1,
//                    padding: EdgeInsets.only(bottom: 10.0),
                    overflow:TextOverflow.ellipsis ,
                    textAlign:TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize: ScreenUtil().setSp(26)),
                  ),
                ],
              ),
            )

        );

      }).toList();

      return Wrap(
        spacing: 0,
        runSpacing:0,
        children: listWidget,
      );
    }else{
      return EmptyDataWidget();
    }
  }

}