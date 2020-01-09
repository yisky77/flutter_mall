import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../login_screen.dart';

//
class ListTileWidget extends StatelessWidget {
  final String titletxt;
  final String subtitle;
  final IconData iconpic;
  final int id;
  ListTileWidget({Key key,this.titletxt,this.subtitle,this.iconpic,this.id}):super(key:key);
//  拨打电话
  void _launchURL() async {
    var phone = '17688886201';
    String url = 'tel:'+phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  //
  Widget _titleWidget(context){
    return InkWell(
        onTap:(){
//          _launchURL();
          print(id);
          Navigator.push(context, new CupertinoPageRoute(builder: (BuildContext context){
            return LoginPage();
          }));
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0,0.0),
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(95),
          alignment: Alignment.centerLeft,
          //        color: Colors.white,
          padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0,8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xfff5f5f5),width: 0),bottom: BorderSide(color: Color(0xfff5f5f5),width: 1))
          ),
          child:new Row(
            children: <Widget>[
              Icon(iconpic,size:25, color: Color(0xfffa436a)),
  //                new Image.asset(iconpic, width: ScreenUtil().setWidth(32),height: ScreenUtil().setHeight(32)),
              Expanded(
                child: new Container(
                  padding: EdgeInsets.only(bottom:0.0,left:15.0),
                  child: Text(
                    titletxt,
                    style: TextStyle(
                      fontSize:16.0,
                      color:Color(0xff4a4a4c),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: new Container(
                  padding: EdgeInsets.only(top:0.0,right:5.0),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize:16.0,
                      color:Color(0xff9ea0a6),
                    ),
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_right,color:Color(0xffc0c4cc)),
  //                new Image.asset('assets/images/home/right.png', width:ScreenUtil().setWidth(50)),
            ],
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
//    print(newGoodsList);
    return _titleWidget(context);
  }
}