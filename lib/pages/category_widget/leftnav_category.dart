import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/category_info.dart';


// 分类左边边数据显示
class LeftnavData extends StatelessWidget {
   List<dynamic> leftnavDataList;
//  LeftnavData({this.leftnavDataList});
  int changeCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
//    print(this.leftnavDataList);
    return Provide<CategoryInfoProvide>(
        builder:(context,child,val) {
          leftnavDataList = Provide.value<CategoryInfoProvide>(context).categoryleftInfo['categoryList'];
          changeCurrentIndex = Provide.value<CategoryInfoProvide>(context).currentIndex;
//          print(leftnavDataList);
            if (leftnavDataList.length>0) {
              return Container(
                width: ScreenUtil().setWidth(180),
                decoration: BoxDecoration(
                    border: Border(
                      //              right: BorderSide(width: 1,color:Colors.black12)
                    )
                ),
                child: ListView.builder(
                  itemCount: leftnavDataList.length,
                  itemBuilder: (context, index) {
                    return _leftInkWel(context, index);
                  },
                ),
              );
            } else {
//              return
            }
        }
      );
  }


  Widget _leftInkWel(context,int index){
    bool isClick=false;
    isClick=(index==changeCurrentIndex)?true:false;
    print(changeCurrentIndex);
    return InkWell(
      onTap: (){
        var id = leftnavDataList[index]['id'];
//        获取id对应的分类信息数据
        Provide.value<CategoryInfoProvide>(context).getCategoryIdInfo(id);
        Provide.value<CategoryInfoProvide>(context).changeCategoryCurrentIndex(index);
      },
      child: Container(
        height: ScreenUtil().setHeight(90),
        padding:EdgeInsets.only(left:0,top:0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isClick ? Color(0xfff8f8f8): Colors.white,
            border:Border(
                bottom:BorderSide(width: 0.5,color:Colors.black12),
                left:BorderSide(width: 3,color:isClick ? Color(0xfffa436a):Color(0xffffffff))
            )
        ),
        child: Text('${leftnavDataList[index]['name']}',style: TextStyle(fontSize:ScreenUtil().setSp(28),
            color: isClick ? Color(0xfffa436a): Color(0xff606266))),
      ),
    );
  }
}

