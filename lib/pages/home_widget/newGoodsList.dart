import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/titleWidget.dart';
import '../../routers/application.dart';
import 'package:fluro/fluro.dart';

// 首页轮播组件编写
class NewGoods extends StatelessWidget {
  final List newGoodsList;
  NewGoods({this.newGoodsList});

  //人气推荐内容渲染
  Widget _wrapList(){
    if(newGoodsList.length!=0){
      return SizedBox(//避免listview报错'hasSize'使用sizeBox嵌套一层
        height: ScreenUtil().setHeight(330),
        child: ListView.builder(
            itemCount:newGoodsList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context,index){
              return  InkWell(
                onTap:(){
                  Application.router.navigateTo(context,"/detail?id=${newGoodsList[index]['id']}", transition: TransitionType.cupertino);
                },
                child: Container(
                  width: ScreenUtil().setWidth(300),
//                  height: ScreenUtil().setHeight(300),
                  padding: EdgeInsets.all(10.0),
                  margin:EdgeInsets.only(bottom:0.5),
                  decoration: BoxDecoration(
                      color:Colors.white,
//                      border: Border(right: BorderSide(color: Color(0xfff5f5f5),width: 1),bottom: BorderSide(color: Color(0xfff5f5f5),width: 1))
                  ),
                  child: new Column(
                    children: <Widget>[
                      Image.network('${newGoodsList[index]['picUrl']}',width: ScreenUtil().setWidth(230),height: ScreenUtil().setHeight(150),fit: BoxFit.cover),
                      Text(
                        '${newGoodsList[index]['name']}',
                        maxLines: 1,
                        overflow:TextOverflow.ellipsis,
                        textAlign:TextAlign.left,
                        style: TextStyle(color:Colors.black,fontSize: ScreenUtil().setSp(26),),
                      ),
                      Text(
                        '${newGoodsList[index]['brief']}',
                        maxLines: 1,
                        overflow:TextOverflow.ellipsis ,
                        textAlign:TextAlign.left,
                        style: TextStyle(color:Colors.black,fontSize: ScreenUtil().setSp(26),),
                      ),
                      new Container(
//                          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 5.0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Text(
                              '￥${newGoodsList[index]['retailPrice']} ',
                              style: TextStyle(color:Colors.pink,height:2.0,),
                              ),
                              Text(
                                ' ￥${newGoodsList[index]['counterPrice']}',
                                style: TextStyle(color:Colors.black26,decoration: TextDecoration.lineThrough,height:2.0),
                              )
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

  @override
  Widget build(BuildContext context) {
//    print(newGoodsList);
    return Container(
//      height: ScreenUtil().setHeight(600),
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          TitleWidget(titletxt: ' 新品首发',subtitle: ' The New Production Start', type: 'isNew'),   //品牌制造商标题
          _wrapList(),   //人气推荐内容渲染
        ],
      )
    );
  }
}