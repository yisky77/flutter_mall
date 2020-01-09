import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';
import 'login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  void initState() {
    super.initState();
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds:2000));
    _animation = Tween(begin: 0.3,end:1.0).animate(_controller);


    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        goPage();
//        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>BottomNavigationWidget()), (route)=> route==null);
      }
    });
    //播放动画
    _controller.forward();
  }

  goPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('ishome') != null ) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>BottomNavigationWidget()), (route)=> route==null);
    } else {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route)=> route==null);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition( //透明度动画组件
      opacity: _animation,  //执行动画
//      child: Hero(
//        tag: 'logo',
//        child: Image.asset(
//            "assets/icon/logo.png",
//            width: 20,
//            height: 20,
//        ),
////        transitionOnUserGestures: true,
//      ),
      child: Image.network(  //网络图片
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg',
          scale: 3.0,  //进行缩放
          fit:BoxFit.cover  // 充满父容器
      ),
    );
  }
}