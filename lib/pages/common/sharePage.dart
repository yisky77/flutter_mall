import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SharePage extends StatelessWidget {
  final List navigatorList = [
    {'name':'微信','img': 'share_wechat.png','id':0},
    {'name':'朋友圈','img': 'share_moment.png','id':1},
    {'name':'QQ','img': 'qq.jpg','id':2},
    {'name':'QQ空间','img': 'qzone.jpg','id':3},
    {'name':'新浪微博','img': 'weibo.jpg','id':4},
  ];
  Widget _gridViewItemUI(BuildContext context,item){
    return InkWell(
      onTap: () {
//        int id = item['id'];
//        showModalBottomSheet();

        Fluttertoast.showToast(
            msg: "请稍后...",
//            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
//            timeInSecForIos: 1,
            backgroundColor: Color.fromARGB(150,0,0,0),
            textColor: Colors.white,
//            fontSize: 16.0
        );
      },
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/temp/'+ item['img'],width:ScreenUtil().setWidth(80),height:ScreenUtil().setHeight(80)),
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
    return Container(
        height: 125,
        child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0,10,0,0),
            child: Text('分享到',style: TextStyle(fontSize: 15,color: Color(0xff000000)),),
          ),
          Container(
            height: 80,
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

          )
        ],
      )
    );
  }
}