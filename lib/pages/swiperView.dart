import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//import '../../routers/application.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login_screen.dart';

//// 首页轮播组件编写
class SwiperViewPage extends StatelessWidget {
  final List swiperDataList = [
    {'img': 'https://img.alicdn.com/tfscom/i1/28306811/TB2FK.jbTJ_SKJjSZPiXXb3LpXa_!!28306811.jpg'},
    {'img': 'https://img.alicdn.com/tfscom/i1/28306811/TB2FK.jbTJ_SKJjSZPiXXb3LpXa_!!28306811.jpg'},
    {'img': 'https://img.alicdn.com/tfscom/i1/28306811/TB2FK.jbTJ_SKJjSZPiXXb3LpXa_!!28306811.jpg'},
    {'img': 'https://img.alicdn.com/tfscom/i1/28306811/TB2FK.jbTJ_SKJjSZPiXXb3LpXa_!!28306811.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Swiper(
            itemBuilder: (BuildContext context,int index){
              return swiperData(swiperDataList,index);
            },
            onTap: (index){
              print(index);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route)=> route==null);
            },
            index:0,
            duration: 500,
            scrollDirection: Axis.horizontal,
            loop:false,
            itemCount: swiperDataList.length,
            pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
//                margin: EdgeInsets.only(bottom: 10.0, left: 20.0),
                builder: SwiperPagination.dots
//                builder: DotSwiperPaginationBuilder(
//                    color: Colors.black54,
//                    activeColor: Colors.white
//                )
            ),
            autoplay: false,
          ),
        )
    );
  }

  Widget swiperData (swiperDataList,index) {
//    return Container(
//      child: Text('ssss'),
//    );
      return Image.network("${swiperDataList[index]['img']}",fit:BoxFit.fill);
  }
}