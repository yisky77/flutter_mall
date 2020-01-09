import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import './common/loadingWidget.dart';
import './common/emptydata.dart';
import '../provide/cartprovider.dart';
import './login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home_widget/hotGoodsList.dart';
import '../provide/details_info.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

//import 'package:flutter_easyrefresh/material_header.dart';
//import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    DetailsInfoProvide DetailsInfo = Provider.of<DetailsInfoProvide>(context, listen: false);
    _goCartPage() {
      Navigator.push(context, new CupertinoPageRoute(builder: (BuildContext context){
        return LoginPage();
      }));
    }
//    获取当前商品详情id
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future:_getcartInfo(context),
          builder: (context,snapshot){
            switch(snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting: return LoadingDataWidget();break;
              case ConnectionState.done:
                var CartList = Provider.of<CartProvide>(context).cartList;
                var hotGoodsList = DetailsInfo.hotGoodsList;
                if(snapshot.hasData) {
//                    var goodsInfos = CartList;
                  return EasyRefresh.custom(
                    topBouncing:false,
                    controller: _controller,
                    header: BezierCircleHeader(),
                    footer: BezierBounceFooter(),
                    enableControlFinishRefresh: false,
                    enableControlFinishLoad: true,//是否开启控制结束加载
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return new Container(
                              width: ScreenUtil().setWidth(750),
                              color: Color(0xfff5f5f5),
                              child: Column(
                                children: <Widget>[
                                  CartList != null ?EmptyDataWidget():EmptyDataWidget(),
                                  Center(
                                    child: Container(
                                        margin: EdgeInsets.all(50),
                                        child: MaterialButton(
                                          color: Color(0xfffa436a),
                                          textColor: Colors.white,
                                          child: new Text('去登录'),
                                          onPressed: () {
                                            _goCartPage();
                                          },
                                        )
                                    ),
                                  ),
                                  HotGoods(hotGoodsList),
                                ],
                              ),
                          );
                        },
                          childCount: 1,
                        ),
                      ),
                    ],
                    onRefresh: () async{
                      _getcartInfo(context).then((res) {
                        _controller.finishLoad(success:true);
                      });
                    },
                    onLoad: () async {
                      _getcartInfo(context).then((res) {
                        _controller.finishLoad(success:true);
                          _controller.finishLoad(noMore: true);
                      });
                    },
                  );
                } else {
                  return EmptyDataWidget();
                }
            }
          }
      ),
    );
  }

  Future _getcartInfo(BuildContext context ) async{
    CartProvide cartInfo = Provider.of<CartProvide>(context, listen: false);
    cartInfo.getCartList();
    return '完成加载';
  }
}



