import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 首页轮播组件编写
class LoadingDataWidget extends Dialog {
  final String text = '正在加载';
//  LoadingDataWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency,
      child: new Center(
        child: new SizedBox(
//          color: Color(0xffcccccc),
          width: 120.0,
          height: 120.0,
          child: new Container(
//          color: Color(0xffcccccc),
          decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(),
                new Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: new Text(text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}