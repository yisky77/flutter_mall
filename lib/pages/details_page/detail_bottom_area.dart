import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import '../bottom_navigation_widget.dart';
import '../login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isCollect = Provider.of<DetailsInfoProvide>(context, listen: false).isCollect;

    _goCartPage() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getBool('islogin') != null ) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>BottomNavigationWidget()), (route)=> route==null);
      } else {
        Navigator.push(context, new CupertinoPageRoute(builder: (BuildContext context){
          return LoginPage();
        }));
      }
    }
    return Container(
      height: ScreenUtil().setHeight(110),
      decoration: BoxDecoration(
          color: Color.fromARGB(170, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (context)=>BottomNavigationWidget()), (route)=> route==null);
            },
            child: Container(
              width: ScreenUtil().setWidth(110),
              margin: EdgeInsets.only(top:5),
              alignment: Alignment.center,
              child:Column(
                  children: <Widget>[
                    Image.asset('assets/images/icon/tab-home.png',width: ScreenUtil().setWidth(50)),
                    Text('首页', style: TextStyle(color: Color(0xff909399),fontSize: ScreenUtil().setSp(22)),),
                  ]
              ),
            ) ,
          ),
          InkWell(
            onTap: _goCartPage,
            child: Container(
              width: ScreenUtil().setWidth(110),
              margin: EdgeInsets.only(top:7),
              alignment: Alignment.center,
              child:Column(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 25,
                      color: Color(0xff909399),
                    ),
                    Text('购物车', style: TextStyle(color: Color(0xff909399),fontSize: ScreenUtil().setSp(22)),),
                  ]
              ),
            ),
          ),
          InkWell(
            onTap: (){
              var DetailsInfoGoods = Provider.of<DetailsInfoProvide>(context, listen: false);
              DetailsInfoGoods.collectGoodsid();
//              _collectGoodsid(context);
            },
            child: Container(
              width: ScreenUtil().setWidth(110),
              margin: EdgeInsets.only(top:2),
              alignment: Alignment.center,
              child:Column(
                  children: <Widget>[
                    LikeButton(
                      likeBuilder: (bool isLiked){
                        return Icon(isCollect ?Icons.favorite:Icons.favorite_border,size: 25,color: isCollect ? Color(0xfffa436a): Color(0xff909399));
                      },
//                      onTap: (bool isLiked) {
//                        _collectGoodsid(context);
//                      }
                    ),
                    Text('收藏', style: TextStyle(color: Color(0xff909399),fontSize: ScreenUtil().setSp(22)),),
                  ]
              ),
            ) ,
          ),
          Container(
            width: ScreenUtil().setWidth(360),
            height: ScreenUtil().setHeight(70),
            decoration: new BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xffffac30), Color(0xfffa436a), Color(0xffF56C6C)]
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: _goCartPage,
                  child: Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(190),
                    height: ScreenUtil().setHeight(70),
                    child: Text(
                      '加入购物车',
                      style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(25)),
                    ),
                  ) ,
                ),
                InkWell(
                  onTap: _goCartPage,
                  child: Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(170),
//                    padding: EdgeInsets.only(right:10.0),
                    height: ScreenUtil().setHeight(70),
                    decoration: new BoxDecoration(
                      border: Border(left: BorderSide(color: Color(0xfff5f5f5),width: 0.3)),
                    ),
                    child: Text(
                      '马上购买',
                      style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(25)),
                    ),
                  ) ,
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
