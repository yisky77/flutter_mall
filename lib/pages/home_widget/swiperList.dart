import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import '../../routers/application.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/browser.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({this.swiperDataList});

  void _launchURL(url) async {
//      print(item);
//    String url = 'tel:17688886201';//不能拨打电话、暂时不知道什么原因
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return InkWell(
              onTap: (){
                var link = swiperDataList[index]['link'];
                print('link');
                Navigator.of(context)
                    .push(new CupertinoPageRoute(builder: (_) {
                  return new Browser(
                    url: link,
                    title: swiperDataList[index]['name'],
                  );
                }));
//                _launchURL('${swiperDataList[index]['link']}');
//                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
//                  return  new WebviewScaffold(
//                      url: link,
//                      appBar: new AppBar(
//                          title: new Text("Widget webview"),
//                      )
//                    );
//                  })
//                );
//                Application.router.navigateTo(context,"/detail?id=${swiperDataList[index]['id']}");
              },
              child:  Image.network("${swiperDataList[index]['url']}",fit:BoxFit.fill),
            );
          },
          index:0,
          duration: 500,
          loop:true,
          itemCount: swiperDataList.length,
          pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
  //            margin: EdgeInsets.only(bottom: 10.0, left: 20.0),
  //            builder: SwiperPagination.fraction
              builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white
              )
          ),
          autoplay: true,
        ),
    );
  }
}