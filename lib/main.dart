import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'package:provider/provider.dart';
import 'provide/counter.dart';
import 'provide/details_info.dart';
import 'provide/category_info.dart';
import 'provide/searchpro_provide.dart';
import 'provide/cartprovider.dart';
import './routers/routes.dart';
import './routers/application.dart';
import 'package:fluro/fluro.dart';
//import 'pages/swiperView.dart';
//import './pages/bottom_navigation_widget.dart';

void main(){
    runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var counter = Counter();
    var detailsInfoProvide = DetailsInfoProvide();
    var categoryInfoProvide = CategoryInfoProvide();
    var searchProInfoProvide = SearchProInfoProvide();
    var cartProvide = CartProvide();
    final router = Router();
    Routes.configureRoutes(router);
    Application.router=router;
    final title="新巢蜜商城";
    return MultiProvider(
            providers: [
            //这里是关键注册通知吧
              ChangeNotifierProvider(builder: (_) => cartProvide),
              ChangeNotifierProvider(builder: (_) => detailsInfoProvide),
              ChangeNotifierProvider(builder: (_) => categoryInfoProvide),
              ChangeNotifierProvider(builder: (_) => searchProInfoProvide)
            ],
            child: MaterialApp(
              title:title,
              onGenerateRoute: Application.router.generator,
              debugShowCheckedModeBanner: false,
              theme: new ThemeData(
                brightness: Brightness.light, //body背景颜色
                primaryColor: Color(0xfffa436a), //标题栏背景颜色
//                primaryColor: Colors.pink[300], //标题栏背景颜色
                accentColor: Colors.blue,
                highlightColor: Colors.transparent,
                splashFactory: const NoSplashFactory(), //去除水波纹
              ),
      //        home: BottomNavigationWidget()
  //            home: MultiProvider(
  //              providers: [
  //              //这里是关键注册通知吧
  //                  ChangeNotifierProvider(builder: (_) => counter),
  //              //  ChangeNotifierProvider(builder: (_) => detailsInfoProvide),
  //              //  ChangeNotifierProvider(builder: (_) => categoryInfoProvide),
  //                  ChangeNotifierProvider(builder: (_) => searchProInfoProvide),
  //              ],
  //              child: SplashScreen(),
              home: SplashScreen(),
//              home: SwiperViewDiy(),
            )
    );
  }
}

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  InteractiveInkFeature create({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
    @required Offset position,
    @required Color color,
    TextDirection textDirection,
    bool containedInkWell: false,
    RectCallback rectCallback,
    BorderRadius borderRadius,
    ShapeBorder customBorder,
    double radius,
    VoidCallback onRemoved,
  }) {
    return new NoSplash(
      controller: controller,
      referenceBox: referenceBox,
      color: color,
      onRemoved: onRemoved,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
    Color color,
    VoidCallback onRemoved,
  }) : assert(controller != null),
        assert(referenceBox != null),
        super(controller: controller, referenceBox: referenceBox, onRemoved: onRemoved) {
    controller.addInkFeature(this);
  }
  @override
  void paintFeature(Canvas canvas, Matrix4 transform) { }
}