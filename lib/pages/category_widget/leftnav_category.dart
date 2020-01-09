import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provide/category_info.dart';


// 分类左边边数据显示
class LeftnavData extends StatelessWidget {
  List<dynamic> leftnavDataList;
  int changeCurrentIndex = 0;
  LeftnavData({this.leftnavDataList});
  @override
  Widget build(BuildContext context) {
      if (leftnavDataList.length>0) {
        return Container(
          width: ScreenUtil().setWidth(180),
          decoration: BoxDecoration(
              border: Border(
                //              right: BorderSide(width: 1,color:Colors.black12)
              )
          ),
          child: ListView.builder(
            shrinkWrap:true,
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



  Widget _leftInkWel(context, index){
    changeCurrentIndex = Provider.of<CategoryInfoProvide>(context).currentIndex;
    bool isClick=false;
    isClick=(index==changeCurrentIndex)?true:false;
    print(changeCurrentIndex);
    return InkWell(
      onTap: (){
        var id = leftnavDataList[index]['id'];
        CategoryInfoProvide CategoryInfo = Provider.of<CategoryInfoProvide>(context, listen: false);
//        获取id对应的分类信息数据
        CategoryInfo.getCategoryIdInfo(id.toString());
        CategoryInfo.changeCategoryCurrentIndex(index);
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

