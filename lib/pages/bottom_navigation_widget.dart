import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'category_screen.dart';
import 'cart_screen.dart';
import 'person_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState(){
    list
      ..add(HomePage())
      ..add(CategoryScreen())
      ..add(CartScreen())
      ..add(PersonScreen());
    super.initState();
  }

//  final List<BottomNavigationBarItem> bottomTabs = [
//    BottomNavigationBarItem(
////        icon: Icon(CupertinoIcons.home,color: Color(0xfffa436a)),
//        title: Text('首页',style:TextStyle(color:Color.fromARGB(255, 250, 67, 106)))
//    ),
//    BottomNavigationBarItem(
//        icon: Image.asset('assets/images/icon/tab-cate.png',width:32.0,height: 32.0),
//        title:Text('分类',style:TextStyle(color: Color(0xfffa436a)))
//    ),
//    BottomNavigationBarItem(
//        icon: Image.asset('assets/images/icon/tab-cart.png',width:32.0,height: 32.0),
//        title:Text('购物车',style:TextStyle(color: Color(0xfffa436a)))
//    ),
//    BottomNavigationBarItem(
//        icon: Image.asset('assets/images/icon/tab-my.png',width:32.0,height: 32.0),
//        title:Text('会员中心',style:TextStyle(color: Color(0xfffa436a)))
//    ),
//  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
//      防止页面重新加载请求
      body: IndexedStack(
          index: _currentIndex,
          children: list
      ),
//      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/icon/tab-home-current.png',width:32.0,height: 32.0),
                icon: Image.asset('assets/images/icon/tab-home.png',width:32.0,height: 32.0),
                title: Text('首页')
            ),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/icon/tab-cate-current.png',width:32.0,height: 32.0),
                icon: Image.asset('assets/images/icon/tab-cate.png',width:32.0,height: 32.0),
                title:Text('分类')
            ),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/icon/tab-cart-current.png',width:32.0,height: 32.0),
                icon: Image.asset('assets/images/icon/tab-cart.png',width:32.0,height: 32.0),
                title:Text('购物车')
            ),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/icon/tab-my-current.png',width:32.0,height: 32.0),
                icon: Image.asset('assets/images/icon/tab-my.png',width:32.0,height: 32.0),
                title:Text('会员中心')
            ),
          ],
          currentIndex:_currentIndex,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showSelectedLabels: true,//是否显示选中的文字
          showUnselectedLabels: true,//是否显示未选中的文字
          unselectedItemColor: Color(0xffc0c4cc),
          selectedItemColor: Color(0xfffa436a),
          onTap:(int index){
            setState((){
              _currentIndex= index;
            });
          },
          type:BottomNavigationBarType.fixed,
      ),
    );
  }
}