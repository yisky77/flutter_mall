import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 首页轮播组件编写
class EmptyDataWidget extends StatelessWidget {
  final String img;
  final String subtitle;
  EmptyDataWidget({Key key,this.img,this.subtitle}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Container(
//        color: Colors.white,
//        height: ScreenUtil().setHeight(1050),
        child:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Image.asset('assets/images/temp/default.png', width:ScreenUtil().setWidth(300), height:ScreenUtil().setHeight(300)),
            Text('很遗憾，暂无数据！')
          ],
        ),
      )
    );
  }
}