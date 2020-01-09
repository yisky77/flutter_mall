import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../searchpro/searchproList.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provide/searchpro_provide.dart';
import '../../common/emptydata.dart';
import '../../common/loadingWidget.dart';
//import 'dart:convert';
import '../../common/searchdataWidget.dart';


//import 'dart:convert' as convert;
class NewGoodsPage extends StatelessWidget {
  int currentPage = 1;
  String pic = 'https://yanxuan.nosdn.127.net/14924199099661697.jpg';
  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
        children: <Widget>[
          new Image.network(pic,width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(350),fit: BoxFit.cover),
          new Positioned(
              top: 75.0,
              left: ScreenUtil().setWidth(260),
              child: new Text(
                '大家都在买的',
                style: TextStyle(color:Colors.white,fontSize: ScreenUtil().setSp(36)),
              )
          ),
        ]
    );
    return Scaffold(
      appBar:AppBar(
          title:Text('新品首发'),
          centerTitle: true,
          actions:<Widget>[
            IconButton(
                icon:Icon(Icons.search),
                onPressed: (){
                  showSearch(context:context,delegate: searchBarDelegate());
                }
            ),
          ]
      ),
      body: FutureBuilder(
          future:_getsearchBackInfo(context),
          builder: (context,snapshot){
            switch(snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting: return LoadingDataWidget();break;
              case ConnectionState.done:
                var newGoodslist = Provider.of<SearchProInfoProvide>(context).newGoodslistInfo['data']['list'];
                if (snapshot.hasData && newGoodslist.length>0) {
                  return SingleChildScrollView(
                    child: new Container(
                      width: ScreenUtil().setWidth(750),
                      color: Color(0xfff5f5f5),
                      child: Column(
                        children: <Widget>[
                          stack,
                          SearchProInfoWidget(newGoodslist),
                        ],
                      ),
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

  Widget SearchProInfoWidget(newGoodslist) {
    return Container(
        margin:EdgeInsets.only(top: 10.0),
        width: ScreenUtil().setWidth(750),
        child:  new Container(
            width: ScreenUtil().setWidth(750),
            decoration: BoxDecoration(
                border: Border(
                  //              right: BorderSide(width: 1,color:Colors.black12)
                )
            ),
            child: HotGoods(newGoodslist),//
          )
        );
  }

  Future _getsearchBackInfo(BuildContext context ) async{
    await Provider.of<SearchProInfoProvide>(context, listen: false).getNewGoodsInfos(currentPage);
    return '完成加载';
  }
}

class searchBarDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon:Icon(Icons.clear),
        onPressed: ()=>query = "",)
    ];
  }

//  关闭搜索框
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchDataWidget(query: this.query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = '';
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
          title: RichText(
            text: TextSpan(
              text: '',
//                  style: TextStyle(
//                      color: Colors.black, fontWeight: FontWeight.bold),
//                  children: [
//                    TextSpan(
//                        text: suggestionList[index].substring(query.length),
//                        style: TextStyle(color: Colors.grey))
//                  ])),
            ),
          ),
        )
    );
  }


}