import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provide/searchpro_provide.dart';
import '../../common/emptydata.dart';
import '../../common/loadingWidget.dart';
//import '../../../routers/application.dart';

class BrandGoodsPage extends StatelessWidget {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title:Text('品牌商列表'),
          centerTitle: true,
      ),
      body: FutureBuilder(
          future:_getsearchBackInfo(context),
          builder: (context,snapshot){
            switch(snapshot.connectionState) {
              case ConnectionState.none: return LoadingDataWidget();
              case ConnectionState.active: return LoadingDataWidget();
              case ConnectionState.waiting: return LoadingDataWidget();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return SizedBox(
                      width: ScreenUtil().setWidth(750),
                      child: Provide<SearchProInfoProvide>(
                          builder:(context,child,val) {
                            var topicGoodslist = Provide.value<SearchProInfoProvide>(context).brandGoodslistInfo['data']['list'];
                            if (topicGoodslist.length > 0) {
                              return Container(
                                  color: Color(0xfff5f5f5),
                                  child: ListView.builder(
                                    itemCount: topicGoodslist.length,
                                    itemBuilder: (context, index) {
                                      return contentInkWel(context, index, topicGoodslist);
                                    },
//                        ),
                                  )
                              );
                            } else {
                              return EmptyDataWidget();
                            }
                          }
                      ),
                  );
                } else {
                  return EmptyDataWidget();
                };
            }
          }
      ),
    );
  }

  Future _getsearchBackInfo(BuildContext context ) async{
    await  Provide.value<SearchProInfoProvide>(context).getBrandGoodsInfos(currentPage);
    return '完成加载';
  }

  Widget contentInkWel(context,int index, topicGoodslist){
    var stack = new Stack(
        children: <Widget>[
          new Image.network('${topicGoodslist[index]['picUrl']}',width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(450),fit: BoxFit.cover),
          new Positioned(
              top: 100.0,
              left: ScreenUtil().setWidth(260),
              child: new Text(
                '${topicGoodslist[index]['name']} | ${topicGoodslist[index]['floorPrice']}',
                style: TextStyle(
                    color:Colors.white,
                    fontSize: ScreenUtil().setSp(36),
                    decorationColor: const Color(0xffffffff), //线的颜色
                    decoration: TextDecoration.none, //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                    decorationStyle: TextDecorationStyle.solid, //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
                    wordSpacing: 0.0, //单词间隙(负值可以让单词更紧凑)
                    letterSpacing: 0.0, //字母间隙(负值可以让字母更紧凑)
//                    fontStyle: FontStyle.italic, //文字样式，斜体和正常
                    fontWeight: FontWeight.bold, //字体粗细  粗体和正常
                 ),
              )
          ),
        ]
    );

    return InkWell(
      onTap: (){
        var id = topicGoodslist[index]['id'];
//        获取id对应的品牌信息数据
//        Application.router.navigateTo(context,"/searchprolist/${id}", transition: TransitionType.inFromRight);
      },
      child: Container(
//        height: ScreenUtil().setHeight(90),
//        padding:EdgeInsets.only(left:0,top:0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            stack,
          ],
        )
      ),
    );
  }

}