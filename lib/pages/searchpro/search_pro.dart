import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './searchproList.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/searchpro_provide.dart';
import '../common/emptydata.dart';
import '../common/loadingWidget.dart';
import '../common/searchdataWidget.dart';

class SearchProlist extends StatelessWidget {
  int currentPage = 1;
  String id;
  SearchProlist(this.id);

  @override
  Widget build(BuildContext context) {
//    print(json.decode(data.toString()));
//    var user = convert.jsonDecode(data);
//    print(user);
    return Scaffold(
      appBar:AppBar(
          title:Text('商品名称'),
//          leading: Icon(Icons.arrow_back,color: Color(0xfffa436a)),
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
                if(snapshot.hasData) {
                  SearchProInfoProvide searchpro = Provider.of<SearchProInfoProvide>(context);
//                  print(searchpro.searchProInfo);
                  if (searchpro.searchProInfo != null) {
                    var searchlist = searchpro.searchProInfo['data']['list'];
                    return SingleChildScrollView(
                      child: new Container(
                        width: ScreenUtil().setWidth(750),
                        color: Color(0xfff5f5f5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: ScreenUtil().setWidth(750),
                              child: Container(
                                width: ScreenUtil().setWidth(750),
                                child: HotGoods(searchlist), //
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    print('sdfsdfsdf');
                    return EmptyDataWidget();
                  };
                }
            }
          }
      ),
    );
  }

  Future _getsearchBackInfo(BuildContext context ) async{
    Provider.of<SearchProInfoProvide>(context, listen: false).getSearchProInfos(currentPage,id);
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