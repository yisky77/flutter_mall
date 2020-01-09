import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_navigation_widget.dart';
import 'swiperView.dart';
import 'login_screen.dart';
//import '../routers/application.dart';
//import 'package:fluro/fluro.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController _logoController;
  Tween _scaleTween;
  CurvedAnimation _logoAnimation;

  @override
  void initState() {
    super.initState();
    _scaleTween = Tween(begin: 0, end: 1);
    _logoController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 300))
      ..drive(_scaleTween);
    Future.delayed(Duration(milliseconds: 500), () {
      _logoController.forward();
    });
    _logoAnimation =
        CurvedAnimation(parent: _logoController, curve: Curves.easeOutQuart);

    _logoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 300), () {
          goPage();
        });
      }
    });
  }

  void goPage() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('ishome') != null ) {
//      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SwiperViewPage()), (route)=> route==null);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>BottomNavigationWidget()), (route)=> route==null);
    } else {
//      Application.router.navigateTo(context,"/login", clearStack:true,transition: TransitionType.cupertino);
//      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route)=> route==null);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SwiperViewPage()), (route)=> route==null);
    }
//    await Application.initSp();
//    UserModel userModel = Provider.of<UserModel>(context);
//    userModel.initUser();
//    if (userModel.user != null) {
//      await NetUtils.refreshLogin(context).then((value){
//        if(value.data != -1){
//          NavigatorUtil.goHomePage(context);
//        }
//      });
//      Provider.of<PlayListModel>(context).user = userModel.user;
//    } else
//      NavigatorUtil.goLoginPage(context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
//          child: Hero(
//              tag: 'logo',
//              child: Image.asset(
//                'assets/icon/logo.png',
//              ),
//            )
          child: ScaleTransition(
            scale: _logoAnimation,
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/icon/logo.png',
              ),
            ),
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _logoController.dispose();
  }
}