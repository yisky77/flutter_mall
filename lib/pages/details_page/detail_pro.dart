import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
//import './detail_top_area.dart';
//import './details_page/details_explain.dart';
//import './details_page/details_tabBar.dart';
//import './details_page/details_web.dart';
//import './details_page/details_bottom.dart';
//import '../home_widget/navigatorList.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import '../common/loadingWidget.dart';

class DetailsPage extends StatelessWidget {
  final id;
  DetailsPage(this.id);
  @override
  Widget build(BuildContext context) {
//    print('sssss'+id);
    return Scaffold(
//        appBar: AppBar(
//          leading: IconButton(
//            icon:Icon(Icons.arrow_back),
//            onPressed: (){
//              print('返回上一页');
//              Navigator.pop(context);
//            },
//          ),
//          title: Text('商品详细页'),
//        ),
        appBar:AppBar(
          title: Text('商品详细页'),
          centerTitle:true,
        ),
        body:FutureBuilder(
            future: _getBackInfo(context) ,
            builder: (context,snapshot){
              if(snapshot.hasData){
//                var data = json.decode(snapshot.data.toString());
                print(snapshot.data);
                return Stack(
                  children: <Widget>[
                    ListView(
                      children: <Widget>[
//                        Text('SSS'),
//                        TopNavigator(),
//                        DetailsExplain(),
//                        DetailsTabBar(),
//                        DetailsWeb(),
                      ],
                    ),
//                    Positioned(
//                        bottom: 0,
//                        left: 0,
////                        child: DetailsBottom()
//                    )
                  ],
                );




              }else{
                return LoadingDataWidget();
              }
            }
        )
    );
  }

  Future _getBackInfo(BuildContext context )async{
    await  Provide.value<DetailsInfoProvide>(context).getGoodsInfo(id);
    return '完成加载';
  }

}