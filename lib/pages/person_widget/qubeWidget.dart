import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './order/order.dart';
import 'package:flutter/cupertino.dart';

class QubeWidget extends StatelessWidget {
  Widget qube(IconData icon,String label,context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
//            cupertino右划返回操作
            CupertinoPageRoute(builder: (BuildContext context){
              return MyOrder();
            }
//            new MaterialPageRoute(builder: (context) {
//                //指定跳转的页面
//                return new MyOrder();
//            },
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //      childred: new Stack(既
          Icon(icon, size: 30, color: Color(0xfffa436a)),
          //        new Image.asset(icon, width: ScreenUtil().setWidth(50),height: ScreenUtil().setHeight(50)),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15.0,
                color: Color(0xff4a4a4c),
              ),
            ),
          ),
        ],
      ),
    );
}
  //
  Widget _titleWidget(context){
    return Container(
      margin: EdgeInsets.only(top:5.0),
      padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0,0.0),
      decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(0.0),
        ),
//    eInsets.only(top:10.0),
//      width: ScreenUtil().setWidth(750),
//      height: ScreenUtil().setHeight(295),
//      alignment: Alignment.centerLeft,
      //        color: Colors.white,
//      padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0,8.0),
      child: new Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(160),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Color(0xfff5f5f5), width: 10)),
//                  borderRadius: const BorderRadius.all(const Radius.circular(8.0))
              ),
              child: Row(
                children: <Widget>[
                  new Expanded(child: qube(Icons.reorder, '全部订单',context),),
                  new Expanded(child: qube(Icons.payment, '代付款',context),),
                  new Expanded(child: qube(Icons.shopping_basket, '待收货',context),),
                  new Expanded(child: qube(Icons.comment, '待评价',context),),
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(160),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Color(0xfff5f5f5),width: 10)),
                //                  borderRadius: const BorderRadius.all(const Radius.circular(8.0))
              ),
//              margin: EdgeInsets.only(bottom:10.0),
              child: Row(
                children: <Widget>[
                  new Expanded(child: qube(Icons.satellite, '我的优惠券',context),),
                  new Expanded(child: qube(Icons.screen_share, '分销中心',context),),
                  new Expanded(child: qube(Icons.favorite_border, '我的收藏',context),),
                  new Expanded(child: qube(Icons.feedback, '意见反馈',context),)
                ],
              ),
            ),
         ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//    print(newGoodsList);
    return _titleWidget(context);
  }
}