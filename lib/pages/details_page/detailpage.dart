import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provide/details_info.dart';
import '../common/loadingWidget.dart';
import 'pro.dart';
import 'recommend.dart';
import '../common/sharePage.dart';

class DetailsPage extends StatefulWidget {
  final id;
  DetailsPage(this.id);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with TickerProviderStateMixin {
  TabController _controller;
  int index = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2,vsync: this,initialIndex: index);
  }

  @override
  Widget build(BuildContext context) {
//    设置当前商品详情id
    DetailsInfoProvide DetailsInfo = Provider.of<DetailsInfoProvide>(context, listen: false);
    DetailsInfo.setProId(widget.id);

    return Scaffold(
//      backgroundColor: Colors.transparent,
      appBar: AppBar(
//          backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
          width: 140,
          child:TabBar(
            indicatorColor: Color(0xfffa436a),//选中时下划线颜色,如果使用了indicator这里设置无效
            labelColor: Color(0xffffffff),//选中字体颜色
            unselectedLabelColor: Color(0xffeeeeee),//未选中字体颜色
            labelStyle: TextStyle(fontSize: 18),//选中字体大小
            unselectedLabelStyle: TextStyle(fontSize: 18),//未选中字体大小
            indicatorWeight: 2.5,//下划线高度
            indicatorPadding: EdgeInsets.fromLTRB(20,0,20,5),//下划线内边距
            tabs: <Widget>[
              Tab(child: Text('商品'),),
              Tab(child: Text('推荐'),)
            ],
            controller: _controller,
          ),
        ),
        actions:<Widget>[
          IconButton(icon:Icon(Icons.share), onPressed: (){
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SharePage();
              },
            );
          }),
        ]
      ),
        body:TabBarView(
          controller: _controller,
          children: <Widget>[
            proPage(),
            recommendPage(),
          ],
        )
    );
  }
//
//  Future _getBackInfo(BuildContext context )async{
//    await  Provide.value<DetailsInfoProvide>(context).getGoodsInfo(id);
//    return '完成加载';
//  }
}
