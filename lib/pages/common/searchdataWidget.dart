import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import '../../provide/searchpro_provide.dart';
import '../searchpro/searchproList.dart';
import '../common/emptydata.dart';
import '../common/loadingWidget.dart';

// 首页轮播组件编写
class SearchDataWidget extends StatelessWidget {
  final String query;
  SearchDataWidget({this.query});

  @override
  Widget build(BuildContext context) {
    print(this.query);
    return FutureBuilder(
        future: _getsearchBackInfo(context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return LoadingDataWidget();break;
            case ConnectionState.done:
              SearchProInfoProvide searchinput = Provider.of<SearchProInfoProvide>(context, listen: false);
              if (searchinput.searchProlistInfo != null) {
                var searchlist = searchinput.searchProlistInfo['data']['list'];
                print(searchlist);
                return Container(
                    width: ScreenUtil().setWidth(750),
                    child: SingleChildScrollView(
                        child: Container(
                          child: HotGoods(searchlist), //
                        )
                    )
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      EmptyDataWidget(),
                    ],
                  ),
                );
              }
          }
        }
    );
  }
  Future _getsearchBackInfo(BuildContext context ) async{
    await Provider.of<SearchProInfoProvide>(context, listen: false).getSearchNameInfos(this.query,1);
    return '完成加载';
  }
}