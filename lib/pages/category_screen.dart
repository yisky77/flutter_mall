import 'package:flutter/material.dart';
import './category_widget/leftnav_category.dart';
import './category_widget/right_catedata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../provide/category_info.dart';
import './common/loadingWidget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
//import 'package:flutter_easyrefresh/material_header.dart';
//import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import './common/emptydata.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  EasyRefreshController _controller;
  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
//    final height = window.physicalSize.height; //获取手机屏幕高度
    return Scaffold(
        appBar:AppBar(
          title: Text('分类'),
          centerTitle:true,
        ),
        body:FutureBuilder(
          future:_getBackInfo(context),
          builder: (context,snapshot){
            CategoryInfoProvide category = Provider.of<CategoryInfoProvide>(context);
            if(snapshot.hasData){
              if(category.categoryleftInfo['errno'] == 0) {
                var leftnavDataList = category.categoryleftInfo['data']['categoryList'];
                if (leftnavDataList.length > 0) {
                  return EasyRefresh.custom(
                      topBouncing: false,
                      controller: _controller,
                      header: BezierCircleHeader(),
                      footer: BezierBounceFooter(),
                      enableControlFinishRefresh: false,
                      enableControlFinishLoad: true,
                      //是否开启控制结束加载
                      slivers: <Widget>[
                        SliverList(
                            delegate: SliverChildBuilderDelegate((context, index) {
                              return SizedBox(
                                  child: Container(
                                      color: const Color(0xffffffff),
                                      //0x 后面开始 两位FF表示透明度16进制，或者Colors.white
                                      child: Row(
                                        children: <Widget>[
                                          LeftnavData(leftnavDataList: leftnavDataList),
                                          Container(
                                              width: ScreenUtil().setWidth(570),
                                              color: Color(0xfff8f8f8),
                                              padding: EdgeInsets.only(left:10,top:0),
                                              child: ListView(
                                                shrinkWrap:true,
                                                children: <Widget>[
                                                  Rightcatedata(),
                                                ],
                                              ),
                                          ),
                                        ],
                                      )
                                  )
                              );
                            },
                              childCount: 1,
                            )
                        )
                      ],
                      onRefresh: () async {
                        _getBackInfo(context);
                      }
                  );
                } else {
                  return EmptyDataWidget();
                }
              } else {
                return EmptyDataWidget();
              }
            } else if (snapshot.hasError) {
//              Fluttertoast.showToast(
//                  msg: "加载分类出错",
//                  toastLength: Toast.LENGTH_SHORT,
//                  gravity: ToastGravity.CENTER,
//                  timeInSecForIos: 1,
//                  backgroundColor: Color.fromARGB(100,0,0,0),
//                  textColor: Colors.white,
//                  fontSize: 16.0
//              );
            } else {
              return LoadingDataWidget();
            }
          },
        ),
    );
  }

  Future _getBackInfo(BuildContext context )async{
      CategoryInfoProvide Categorylist = Provider.of<CategoryInfoProvide>(context, listen: false);
      await Categorylist.getCategoryleftInfo().then((res) {
        _controller.finishLoad(success:true);
      });
      return '完成加载';
  }

}