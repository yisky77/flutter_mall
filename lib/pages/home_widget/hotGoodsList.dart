import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/titleWidget.dart';
import '../common/emptydata.dart';

// 首页轮播组件编写
class HotGoods extends StatelessWidget {
  final List hotGoodsList;
  HotGoods(this.hotGoodsList);

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      color:Color(0xfff5f5f5),
      child: Column(
        children: <Widget>[
          TitleWidget(titletxt: ' 人气推荐',subtitle: ' Guess You Like It', type: 'isHot'),   //品牌制造商标题
          _wrapList(),   //人气推荐内容渲染
        ],
      )
    );
  }

  //人气推荐内容渲染
  Widget _wrapList(){
    if(hotGoodsList.length!=0){
      List<Widget> listWidget = hotGoodsList.map((val){
        return InkWell(
            onTap:(){print('点击了人气商品');},
            child: Container(
//              alignment: Alignment.centerLeft,
              width: ScreenUtil().setWidth(374),
              padding: EdgeInsets.all(5.0),
//              margin:EdgeInsets.only(bottom:0.5),
              decoration: BoxDecoration(
                  color:Colors.white,
                  border: Border(right: BorderSide(color: Color(0xfff5f5f5),width: 1),bottom: BorderSide(color: Color(0xfff5f5f5),width: 1))
              ),
              child: Column(
                children: <Widget>[
                  Image.network(val['picUrl'],width: ScreenUtil().setWidth(375),height: ScreenUtil().setHeight(270),fit: BoxFit.cover),
                  Text(
                    val['name'],
                    maxLines: 1,
                    overflow:TextOverflow.ellipsis ,
                    textAlign:TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize: ScreenUtil().setSp(26),),
                  ),
                  Text(
                    val['brief'],
                    maxLines: 1,
                    overflow:TextOverflow.ellipsis ,
                    textAlign:TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize: ScreenUtil().setSp(26),),
                  ),
                  new Container(
                      padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 5.0),
                      alignment: Alignment.centerLeft,
                      child: Row(
                      children: <Widget>[
                        Text(
                          ' ￥${val['retailPrice']} ',
                          style: TextStyle(color:Colors.pink,height:2.0,),
                        ),
                        Text(
                          ' ￥${val['counterPrice']} ',
                          style: TextStyle(color:Colors.black26,decoration: TextDecoration.lineThrough,height:2.0),
                        )
                      ],
                    )
                  ),
                ],
              ),
            )

        );

      }).toList();

      return Wrap(
        spacing: 0,
        children: listWidget,
      );
    }else{
      return EmptyDataWidget();
    }
  }

}