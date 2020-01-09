import 'package:flutter/material.dart';
//import 'package:provide/provide.dart';
import 'package:provider/provider.dart';
import '../provide/counter.dart';
import './person_widget/listTileWidget.dart';
import './person_widget/qubeWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:url_launcher/url_launcher.dart';
import './common/sharePage.dart';

class PersonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
        children: <Widget>[
          new Image.asset('assets/images/temp/userbg.jpg',width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(350),fit: BoxFit.cover),
          new Positioned(
              top: 65.0,
              left: 10.0,
//              child: new CircleAvatar(
//                child: Image.asset('assets/images/icon/tab-cate-current.png',
//                  width: ScreenUtil().setWidth(100),height: ScreenUtil().setHeight(100),fit: BoxFit.cover),
//                radius: 100.0,
////                backgroundColor: Color(0xffffffff),
//              ),
              child:Icon(Icons.person,color:Color(0xfffa436a),size:60.0),
//            child: new Image.asset('assets/images/icon/tab-cate-current.png',
//                  width: ScreenUtil().setWidth(100),height: ScreenUtil().setHeight(100),fit: BoxFit.cover),
          ),
          new Positioned(
              top: 85.0,
              left: 70.0,
              child: new Text(
                'YI',
                style: TextStyle(color:Colors.white,fontSize: ScreenUtil().setSp(36)),
              )
          ),
        ]
    );

    return Scaffold(
          appBar:AppBar(
            title: Text('会员中心'),
            centerTitle:true,
            actions:<Widget>[
              IconButton(icon:Icon(Icons.more_vert), onPressed: (){
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SharePage();
                  },
                );
              }),
            ]
          ),
          body: ListView(
              children: <Widget>[
                Container(
                  color: Color(0xfff5f5f5),
  //                padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                        stack,
                        QubeWidget(),
                        Container(
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0,0.0),
//                          width: ScreenUtil().setWidth(710),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
  //                            border: Border(top: BorderSide(color: Color(0xfff5f5f5),width: 0),bottom: BorderSide(color: Color(0xfff5f5f5),width: 1))
                          ),
                          child: ListTileWidget(iconpic: Icons.room,titletxt: '收货地址',subtitle: '',id: 0),   //
                        ),//
                        ListTileWidget(iconpic: Icons.share,titletxt: '分享',subtitle: '邀请好友赢大礼',id: 1),   //
                        ListTileWidget(iconpic: Icons.smartphone,titletxt: '绑定手机',subtitle: '绑定手机',id: 1),//
                        ListTileWidget(iconpic: Icons.phone,titletxt: '联系客服',subtitle: '联系客服',id: 2),   //
                      ],
                  ),
                ),
              ],
            )
    );
  }
}