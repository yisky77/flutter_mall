import 'package:flutter/material.dart';
import 'swiperList.dart';
import 'package:provider/provider.dart';
import '../../provide/details_info.dart';
import '../common/loadingWidget.dart';
import '../common/emptydata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'detail_bottom_area.dart';

class proPage extends StatelessWidget {
//  final id;
//  proPage(this.id);

  @override
  Widget build(BuildContext context) {
//    获取当前商品详情id
    return Scaffold(
      body: FutureBuilder(
          future:_getProInfo(context),
          builder: (context,snapshot){
            switch(snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting: return LoadingDataWidget();break;
              case ConnectionState.done:
                var goodsInfodetail = Provider.of<DetailsInfoProvide>(context).goodsInfos;
                if(snapshot.hasData) {
                  if (goodsInfodetail != null) {
                    var goodsInfos = goodsInfodetail['data']['info'];
                    var goodsInfo = goodsInfos['gallery'];
                    var contentdetail = goodsInfos['detail'];
//                    设置是否收藏
//                    Provider.of<DetailsInfoProvide>(context, listen: false).setIsCollect(goodsInfodetail['data']['userHasCollect']);

                    List swiperDataList = (goodsInfo as List).cast();
                    return Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: new Container(
                              width: ScreenUtil().setWidth(750),
                              color: Color(0xfff5f5f5),
                              child: Column(
                                children: <Widget>[
                                  SwiperDiy(swiperDataList:swiperDataList),
                                  Container(
                                    padding: EdgeInsets.all(15.0),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      border: Border(right: BorderSide(color: Color(0xfff5f5f5),width: 1),bottom: BorderSide(color: Color(0xfff5f5f5),width: 1))
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '${goodsInfos['name']}',
                                          maxLines: 1,
                                          overflow:TextOverflow.ellipsis ,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize:ScreenUtil().setSp(32.0),
                                            color:Color(0xff303133),
                                          ),
                                        ),
                                        Text(
                                          '${goodsInfos['brief']}',
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                          overflow:TextOverflow.ellipsis ,
                                          style: TextStyle(
                                            fontSize:ScreenUtil().setSp(32.0),
                                            color:Color(0xff303133),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '现价：￥${goodsInfos['retailPrice']}',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(30.0),
                                                  color:Color(0xfffa436a),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '原价：￥${goodsInfos['counterPrice']}',
                                                style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(30.0),
                                                  decoration: TextDecoration.lineThrough,
                                                  color:Color(0xff909399),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(''),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '销量: ${goodsInfos['sortOrder']}',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize:ScreenUtil().setSp(30.0),
                                                  color:Color(0xff909399),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '库存: ${goodsInfos['sortOrder']-7}',
                                                style: TextStyle(
                                                  fontSize:ScreenUtil().setSp(30.0),
                                                  color:Color(0xff909399),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Html(
                                    data: contentdetail,
                                    padding: EdgeInsets.all(0.0),
                                    //点击链接地址的时候响应
                                    onLinkTap: (url) {
                                      print("Opening $url...");
                                    },
                                    //点击图片的时候响应
                                    onImageTap: (src) {
                                      print(src);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: ScreenUtil().setWidth(10),
                            left:ScreenUtil().setWidth(20),
                            right:ScreenUtil().setWidth(20),
                            child: DetailBottom(),
                          )
                        ]
                    );
                  } else {
                    return EmptyDataWidget();
                  };
                } else {
                  return EmptyDataWidget();
                }
            }
          }
      ),
    );
  }

  Future _getProInfo(BuildContext context ) async{
    DetailsInfoProvide DetailsInfo = Provider.of<DetailsInfoProvide>(context, listen: false);
    DetailsInfo.getGoodsInfo();
    return '完成加载';
  }
}
