import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:cached_network_image/cached_network_image.dart';

// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({this.swiperDataList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333,
      width: ScreenUtil().setWidth(750),
      child: Swiper(
          itemBuilder: (BuildContext context,int index){
//            print(index);
            return Image.network("${swiperDataList[index]}",fit:BoxFit.fill);
//            return new CachedNetworkImage(imageUrl: '${swiperDataList[index]}',fit: BoxFit.fill);
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