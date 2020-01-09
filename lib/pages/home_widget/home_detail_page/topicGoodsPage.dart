import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provide/searchpro_provide.dart';
import '../../common/emptydata.dart';
import '../../common/loadingWidget.dart';
//import '../../../routers/application.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

//import 'package:flutter_easyrefresh/material_header.dart';
//import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';

class TopicGoodsPage extends StatefulWidget {
  @override
  _TopicGoodsPageState createState() => _TopicGoodsPageState();
}

class _TopicGoodsPageState extends State<TopicGoodsPage> {
  int currentPage = 1;
  EasyRefreshController _controller;
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('专题精选列表'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: _getsearchBackInfo(context, false),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return LoadingDataWidget();
                case ConnectionState.active:
                  return LoadingDataWidget();
                case ConnectionState.waiting:
                  return LoadingDataWidget();
                case ConnectionState.done:
                  SearchProInfoProvide topicGoods = Provider.of<SearchProInfoProvide>(context);
                  if (snapshot.hasData || topicGoods.topicGoodslistInfo != null) {
                    var topicGoodslist = topicGoods.topicGoodslistInfo;
                    if (topicGoodslist.length > 0) {
                      return SizedBox(
                            width: ScreenUtil().setWidth(750),
                            child: Container(
                                color: Color(0xfffffffff),
                                child: EasyRefresh.custom(
                                  topBouncing:false,
                                  controller: _controller,
                                  header: BezierCircleHeader(),
                                  footer: BezierBounceFooter(),
                                  enableControlFinishRefresh: false,
                                  enableControlFinishLoad: true,//是否开启控制结束加载
                                  slivers: <Widget>[
                                    SliverList(
                                      delegate: SliverChildBuilderDelegate((context, index) {
                                          return contentInkWel(index, topicGoodslist);
                                        },
                                        childCount: topicGoodslist.length,
                                      ),
                                    ),
                                  ],
                                  onRefresh: () async{
                                    this.currentPage = 1;
                                    _getsearchBackInfo(context,false);
                                  },
                                  onLoad: () async {
                                      this.currentPage += 1;
                                      _getsearchBackInfo(context,true);
                                  },
                                )
                            ),
                      );
                    } else {
                      return EmptyDataWidget();
                    }
                  } else {
                    return EmptyDataWidget();
                  };
              }
            }
        ),
      );
  }

  Future _getsearchBackInfo(BuildContext context,bool isloadmore ) async{
//    await Provider.of<SearchProInfoProvide>(context, listen: false).getTopicGoodsInfos(currentPage, isloadmore);
//    return '完成加载';
    var TopicGoods = Provider.of<SearchProInfoProvide>(context, listen: false);
    await TopicGoods.getTopicGoodsInfos(currentPage,isloadmore).then((res) {
      _controller.finishLoad(success:true);
      if(TopicGoods.noMoreTopicData) {
        _controller.finishLoad(noMore: true);
      }
    });
    return '完成加载';
  }

  Widget contentInkWel(index, topicGoodslist){
    var stack = new Column(
        children: <Widget>[
           new Image.network('${topicGoodslist[index]['picUrl']}',width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(450),fit: BoxFit.cover),
           new Container(
             padding: EdgeInsets.all(15.0),
             child: Column(
               children: <Widget>[
                 Text(
                   '${topicGoodslist[index]['title']}',
                   style: TextStyle(
                     color:Color(0xff383838),
                     fontSize: ScreenUtil().setSp(30),
                     decorationColor: const Color(0xffffffff), //线的颜色
                     decoration: TextDecoration.none, //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                     decorationStyle: TextDecorationStyle.solid, //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
                     wordSpacing: 0.0, //单词间隙(负值可以让单词更紧凑)
                     letterSpacing: 0.0, //字母间隙(负值可以让字母更紧凑)
//                    fontStyle: FontStyle.italic, //文字样式，斜体和正常
                     fontWeight: FontWeight.bold, //字体粗细  粗体和正常
                   ),
                 ),
                 new Text(
                     '${topicGoodslist[index]['subtitle']}',
                     style: TextStyle(
                       color:Color(0xff999999),
                       fontSize: ScreenUtil().setSp(26),
                       decorationColor: const Color(0xffffffff), //线的颜色
                       decoration: TextDecoration.none, //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                       decorationStyle: TextDecorationStyle.solid, //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
                       wordSpacing: 0.0, //单词间隙(负值可以让单词更紧凑)
                       letterSpacing: 0.0, //字母间隙(负值可以让字母更紧凑)
//                    fontStyle: FontStyle.italic, //文字样式，斜体和正常
                       fontWeight: FontWeight.normal, //字体粗细  粗体和正常
                     )
                 ),
                 new Text(
                     '${topicGoodslist[index]['price']}起',
                     style: TextStyle(
                       color: Color(0xfffa436a),
                       fontSize: ScreenUtil().setSp(26),
                       decorationColor: const Color(0xffffffff), //线的颜色
                       decoration: TextDecoration.none, //none无文字装饰   lineThrough删除线   overline文字上面显示线    underline文字下面显示线
                       decorationStyle: TextDecorationStyle.solid, //文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double三条线  solid两条线
                       wordSpacing: 0.0, //单词间隙(负值可以让单词更紧凑)
                       letterSpacing: 0.0, //字母间隙(负值可以让字母更紧凑)
//                    fontStyle: FontStyle.italic, //文字样式，斜体和正常
                       fontWeight: FontWeight.normal, //字体粗细  粗体和正常
                     )
                 ),
               ],
             )
           )
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
