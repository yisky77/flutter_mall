import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './searchproList.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/searchpro_provide.dart';
import '../common/emptydata.dart';
//import 'dart:convert' as convert;
class SearchProlist extends StatelessWidget {
//  List<dynamic> searchlist;
  int currentPage = 1;
  String id;
  SearchProlist(this.id);

  @override
  Widget build(BuildContext context) {
    print(this.id);
//    print(json.decode(data.toString()));
//    var user = convert.jsonDecode(data);
//    print(user);
    return Scaffold(
        appBar:AppBar(
            title:Text('商品名称'),
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
              if(snapshot.hasData){
                return SingleChildScrollView(
                    child: new Container(
                      width: ScreenUtil().setWidth(750),
                      color: Color(0xfff5f5f5),
                        child: Column(
                          children: <Widget>[
                            SearchProInfoWidget(),
                          ],
                        ),
                    ),
                );
              } else {
                return EmptyDataWidget();
              };
          }
        ),
    );
  }

  Widget SearchProInfoWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Provide<SearchProInfoProvide>(
          builder:(context,child,val) {
            var searchlist = Provide.value<SearchProInfoProvide>(context).searchProInfo['data']['list'];
//          var searchlist = Provide.value<SearchProInfoProvide>(context).SearchProInfo.data.list;
            if (searchlist.length > 0) {
              return new Container(
                width: ScreenUtil().setWidth(750),
                decoration: BoxDecoration(
                    border: Border(
                      //              right: BorderSide(width: 1,color:Colors.black12)
                    )
                ),
                child: HotGoods(searchlist),//
              );
            } else {
              return EmptyDataWidget();
            }
          }
      )
    );
   }

  Future _getsearchBackInfo(BuildContext context ) async{
    await  Provide.value<SearchProInfoProvide>(context).getSearchProInfos(currentPage,id);
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
    Provide.value<SearchProInfoProvide>(context).getSearchNameInfos(this.query,1);
    return Container(
        width: ScreenUtil().setWidth(750),
        child: Provide<SearchProInfoProvide>(
            builder:(context,child,val) {
              var searchlist = Provide.value<SearchProInfoProvide>(context).searchProlistInfo['data']['list'];
              print(searchlist);
              if (searchlist.length > 0) {
                return SingleChildScrollView(
                    child: Container(
  //                  width: ScreenUtil().setWidth(180),
                      decoration: BoxDecoration(
                          border: Border(
                            //              right: BorderSide(width: 1,color:Colors.black12)
                          )
                      ),
                      child: HotGoods(searchlist),//
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
        )
    );
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