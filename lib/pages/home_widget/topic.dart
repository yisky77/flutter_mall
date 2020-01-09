import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/titleWidget.dart';
import 'package:fluro/fluro.dart';
import '../../routers/application.dart';

// 专题精选组件
class Topic extends StatelessWidget {
  final List topicList;
  Topic({Key key,this.topicList}):super(key:key);

  @override
  Widget build(BuildContext context) {
//    print(topicList);
    return Container(
//      height: ScreenUtil().setHeight(433),
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          TitleWidget(titletxt: ' 专题精选',subtitle: ' Guess You Like It', type: 'isTopic',),   //品牌制造商标题
          _wrapList(),   //人气推荐内容渲染
        ],
      ),
    );
  }

  //专题精选内容渲染
  Widget _wrapList(){
    if(topicList.length!=0){
      return SizedBox(
        height: ScreenUtil().setHeight(440),
        child: ListView.builder(
            itemCount:topicList.length,
            shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
            scrollDirection: Axis.horizontal,
            itemBuilder:(context,index){
              return  InkWell(
                onTap:(){
                  Application.router.navigateTo(context,"/topicGoodsPage", transition: TransitionType.cupertino);
//                  Application.router.navigateTo(context,"/detail?id=${topicList[index]['id']}", transition: TransitionType.inFromRight);
                },
                child: Container(
                  width: ScreenUtil().setWidth(600),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color:Colors.white,
                  ),
                  child: new Column(
                    children: <Widget>[
                      Image.network('${topicList[index]['picUrl']}',width: ScreenUtil().setWidth(600),height: ScreenUtil().setHeight(300),fit: BoxFit.cover),
                      new Container(
//                          width: ScreenUtil().setWidth(500),
//                          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 5.0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Text(
                                '${topicList[index]['title']} ',
                                maxLines: 1,
                                overflow:TextOverflow.ellipsis ,
                                style: TextStyle(color:Colors.black,height:2.0,),
                              ),
                              Text(
                                ' ￥${topicList[index]['price']}元起',
                                style: TextStyle(color:Colors.pink,height:2.0),
                              )
                            ],
                          )
                      ),
                      new Container(
                          width: ScreenUtil().setWidth(600),
//                          height: ScreenUtil().setHeight(100),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Text(
                                '${topicList[index]['subtitle']}',
                                textAlign:TextAlign.left,
                                maxLines: 1,
                                overflow:TextOverflow.ellipsis,
                                style: TextStyle(color:Color(0xff999999), fontSize: ScreenUtil().setSp(26)),
                              ),
//                              Text(
//                                '(阅读量: ${topicList[index]['readCount']})',
//                                overflow:TextOverflow.ellipsis ,
//                                style: TextStyle(color:Color(0xff999999),height:2.0),
//                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      );
    }else{
      return Text('暂无人气推荐商品！');
    }
  }

}