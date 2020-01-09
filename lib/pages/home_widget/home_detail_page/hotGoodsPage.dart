import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../searchpro/searchproList.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provide/searchpro_provide.dart';
import '../../common/emptydata.dart';
import '../../common/loadingWidget.dart';
import '../../common/searchdataWidget.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
//import 'package:flutter_easyrefresh/material_header.dart';
//import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';

  class HotGoodsPage extends StatefulWidget {
    @override
    _HotGoodsPageState createState() => _HotGoodsPageState();
  }

  class _HotGoodsPageState extends State<HotGoodsPage> {
    int currentPage = 1;
    EasyRefreshController _controller;
    String pic = 'http://yanxuan.nosdn.127.net/bf3499ac17a11ffb9bb7caa47ebef2dd.png';

    @override
    void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }
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
          title:Text('人气推荐'),
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
          future:_getsearchBackInfo(context,false),
          builder: (context,snapshot){
            switch(snapshot.connectionState) {
              case ConnectionState.none: return LoadingDataWidget();
              case ConnectionState.active: return LoadingDataWidget();
              case ConnectionState.waiting: return LoadingDataWidget();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  SearchProInfoProvide topicGoods = Provider.of<SearchProInfoProvide>(context);
                  var hotGoodslist = topicGoods.hotGoodslistInfo;
                  if (hotGoodslist.length > 0) {
                    return EasyRefresh.custom(
                      topBouncing:false,
                      controller: _controller,
                      header: BezierCircleHeader(),
                      footer: BezierBounceFooter(),
                      enableControlFinishRefresh: false,
                      enableControlFinishLoad: true,//是否开启控制结束加载
                      slivers: <Widget>[
//                        stack,
                        SliverList(
                          delegate: SliverChildBuilderDelegate((context, index) {
                            return SingleChildScrollView(
                              child: new Container(
                                width: ScreenUtil().setWidth(750),
                                color: Color(0xfff5f5f5),
                                child: Column(
                                  children: <Widget>[
                                    stack,
                                    Container(
                                        margin:EdgeInsets.only(top: 10.0),
                                        width: ScreenUtil().setWidth(750),
                                        child: Container(
                                          width: ScreenUtil().setWidth(750),
                                          child: HotGoods(hotGoodslist),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: hotGoodslist.length,
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
                    );
                  } else {
                    return EmptyDataWidget();
                  };
                }
            }
          }
      ),
    );
  }

  Future _getsearchBackInfo(BuildContext context,bool isloadmore ) async{
    var topicGoods = Provider.of<SearchProInfoProvide>(context, listen: false);
    await topicGoods.getHotGoodsInfos(currentPage,isloadmore).then((res) {
      _controller.finishLoad(success:true);
      if(topicGoods.noMoreTopicData) {
        _controller.finishLoad(noMore: true);
      }
    });
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
  Widget buildResults(BuildContext context){
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