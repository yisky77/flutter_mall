import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';
import 'package:fluro/fluro.dart';

// 首页轮播组件编写
class TitleWidget extends StatelessWidget {
  final String titletxt;
  final String subtitle;
  final String type;
  TitleWidget({this.titletxt,this.subtitle, this.type});

  //  新品首发标题
  Widget _titleWidget(context){
    return InkWell(
        onTap:(){print('点击了${titletxt}标题');
          switch(type) {
              case 'isHot': return Application.router.navigateTo(context,"/hotGoodsPage", transition: TransitionType.cupertino);
              case 'isNew': return Application.router.navigateTo(context,"/newGoodsPage", transition: TransitionType.cupertino);
              case 'isTopic': return Application.router.navigateTo(context,"/topicGoodsPage", transition: TransitionType.cupertino);
              case 'isBrand': return Application.router.navigateTo(context,"/brandGoodsPage", transition: TransitionType.cupertino);
            }
//           Application.router.navigateTo(context,"/searchprolist?id=${val['id']}",transition: TransitionType.cupertino);
        },
        child: Container(
            width: ScreenUtil().setWidth(750),
//            height: ScreenUtil().setHeight(400),
            alignment: Alignment.centerLeft,
            //        color: Colors.white,
            padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0,8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xfff5f5f5),width: 10),bottom: BorderSide(color: Color(0xfff5f5f5),width: 1))
            ),
            child:new Row(
              children: <Widget>[
                new Image.asset('assets/images/home/h1.png', width:ScreenUtil().setWidth(88)),
                Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.only(bottom:5.0,left:5.0),
                        child: Text(
                          titletxt,
                          style: TextStyle(
                            fontSize:18.0,
                            color:Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(left:5.0),
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            fontSize:12.0,
                            color: Color(0xff909399),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Image.asset('assets/images/home/right.png', width:ScreenUtil().setWidth(50)),
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