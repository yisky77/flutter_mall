import 'package:flutter/material.dart';
import 'orderlist_widge.dart';

//class MyOrder extends StatelessWidget {
//  int index;
//  MyOrder(this.index);
//  @override
//  Widget build(BuildContext context) {
//    return KeepAliveDemo(index);
//  }
//}

class KeepAliveDemo extends StatefulWidget {
  int index = 0;
  KeepAliveDemo(this.index);

  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}
/*
with是dart的关键字，意思是混入的意思，
就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，
避免多重继承导致的问题。
SingleTickerProviderStateMixin 主要是我们初始化TabController时，
需要用到vsync ，垂直属性，然后传递this
*/
class _KeepAliveDemoState extends State<KeepAliveDemo> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState(){
    super.initState();
    _controller = TabController(length:5, vsync: this, initialIndex: widget.index);
  }

  //重写被释放的方法，只释放TabController
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text('订单详情'),
            bottom:TabBar(
              indicatorColor: Color(0xffffffff),//选中时下划线颜色,如果使用了indicator这里设置无效
              labelColor: Color(0xffffffff),//选中字体颜色
              unselectedLabelColor: Color(0xffeeeeee),//未选中字体颜色
              labelStyle: TextStyle(fontSize: 15),//选中字体大小
              unselectedLabelStyle: TextStyle(fontSize: 14),//未选中字体大小
              indicatorWeight: 2.5,//下划线高度
//              indicatorPadding: EdgeInsets.fromLTRB(20,10,20,0),//
              controller: _controller,
              tabs:[
                Tab(icon:Icon(Icons.reorder, color: Color(0xffffffff)),text:'订单',),
                Tab(icon:Icon(Icons.payment, color: Color(0xffffffff)),text:'待付款'),
                Tab(icon:Icon(Icons.directions_bike, color: Color(0xffffffff)),text:'待发货'),
                Tab(icon:Icon(Icons.shopping_basket, color: Color(0xffffffff)),text:'待收货'),
                Tab(icon:Icon(Icons.comment, color: Color(0xffffffff)),text:'待评价'),
              ],
            )
        ),
        body:TabBarView(
          controller: _controller,
          children: <Widget>[
            OrderlistPage(),
            OrderlistPage(),
            OrderlistPage(),
            OrderlistPage(),
            OrderlistPage()
          ],
        )
    );
  }
}