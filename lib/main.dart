import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'package:provide/provide.dart';
import 'package:provide/provider.dart';
import 'provide/counter.dart';
import 'provide/details_info.dart';
import 'provide/category_info.dart';
import 'provide/searchpro_provide.dart';
import './routers/routes.dart';
import './routers/application.dart';
import 'package:fluro/fluro.dart';
//import './pages/bottom_navigation_widget.dart';

void main(){
  var counter = Counter();
  var providers = Providers();
  var detailsInfoProvide = DetailsInfoProvide();
  var categoryInfoProvide = CategoryInfoProvide();
  var searchProInfoProvide = SearchProInfoProvide();
  providers
    ..provide(Provider<Counter>.value(counter))//把counter类加入到状态管理
    ..provide(Provider<CategoryInfoProvide>.value(categoryInfoProvide))//
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))//
    ..provide(Provider<SearchProInfoProvide>.value(searchProInfoProvide));//
  runApp(ProviderNode(child: MyApp(),providers: providers, ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //-------------------主要代码start
    final router = Router();
    Routes.configureRoutes(router);
    Application.router=router;
    //-------------------主要代码end
    final title="新巢蜜商城";
    return MaterialApp(
//        providers: [
          ChangeNotifierProvider(builder: (_) => counter),
//          ChangeNotifierProvider(builder: (_) => catergoyGoodsListProvide),
//          ChangeNotifierProvider(builder: (_) => detailsInfoProvide),
//          ChangeNotifierProvider(builder: (_) => cartProvide),
//          ChangeNotifierProvider(builder: (_) => currentIndexProvide),
        ],
        title:title,
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          brightness: Brightness.light, //body背景颜色
          primaryColor: Colors.white, //标题栏背景颜色
//          accentColor: Colors.blue,
//          highlightColor: Colors.transparent,
//          splashFactory: const NoSplashFactory(), //去除水波纹
        ),
//        home: BottomNavigationWidget()
        home: SplashScreen()
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