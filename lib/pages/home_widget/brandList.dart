import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/titleWidget.dart';
import 'package:fluro/fluro.dart';
import '../../routers/application.dart';

// 首页轮播组件编写
class Brand extends StatelessWidget {
  final List brandList;
  Brand({Key key,this.brandList}):super(key:key);

  @override
  Widget build(BuildContext context) {
//    print(brandList);
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          TitleWidget(titletxt: ' 品牌制造商',subtitle: ' The New Production Start', type: 'isBrand',),   //品牌制造商标题
          _wrapList(context)
        ],
      ),
    );
  }

  //人气推荐内容渲染
  Widget _wrapList(context){
    if(brandList.length!=0){
      List<Widget> listWidget = brandList.map((val){
        var stack = new Stack(
            children: <Widget>[
              Image.network(val['picUrl'],width: ScreenUtil().setWidth(375),height: ScreenUtil().setHeight(200),fit: BoxFit.cover),
              new Positioned(
                  top: 15.0,
                  left: 10.0,
                  child: new Text(
                    val['name'],
                    style: TextStyle(color:Colors.white,fontSize: ScreenUtil().setSp(26)),
                  )
              ),
              new Positioned(
                  top: 25.0,
                  left: 10.0,
                  child: new Text(
                    '￥${val['floorPrice']}起',
                    style: TextStyle(color:Colors.white,height:2.0,),
                  )
              ),
            ]
        );
        return InkWell(
            onTap:(){
                Application.router.navigateTo(context,"/brandGoodsPage", transition: TransitionType.inFromRight);
            },
            child: Container(
//              alignment: Alignment.centerLeft,
              width: ScreenUtil().setWidth(374),
              padding: EdgeInsets.all(0.0),
//              margin:EdgeInsets.only(bottom:0.5),
              decoration: BoxDecoration(
                  color:Colors.white,
//                  border: Border(bottom: BorderSide(color: Color(0xfff5f5f5),width: 1))
              ),
              child: stack,
//              new Column(
//                 child: stack,
//              ),
            )

        );

      }).toList();

      return Wrap(
        spacing: 0,
        children: listWidget,
      );
    }else{
      return Text('暂无人气推荐商品！');
    }
  }
}
