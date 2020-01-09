import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './person_widget/listTileWidget.dart';
import './person_widget/qubeWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:url_launcher/url_launcher.dart';
import './common/sharePage.dart';

class PersonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return PersonScreenPage(rpx: rpx);
  }
}


class PersonScreenPage extends StatefulWidget {
  PersonScreenPage({Key key, @required this.rpx}) : super(key: key);
  final double rpx;

  @override
  PersonScreenPageState createState() => PersonScreenPageState();
}

class PersonScreenPageState extends State<PersonScreenPage> with TickerProviderStateMixin {
  double extraPicHeight = 0;
  BoxFit fitType;
  double prev_dy;
  AnimationController animationController;
  Animation<double> anim;
  double rpx;
  double expanedHeight=300;

  @override
  void initState() {
    super.initState();
    prev_dy = 0;
    fitType = BoxFit.cover;
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    anim = Tween(begin: 0.0, end: 0.0).animate(animationController);
  }

  updatePicHeight(changed) {
    if (prev_dy == 0) {
      prev_dy = changed;
    }
    extraPicHeight += changed - prev_dy;
    if (extraPicHeight >= 10) {
      fitType = BoxFit.cover;
    } else {
      fitType = BoxFit.cover;
    }
    setState(() {
      prev_dy = changed;
      extraPicHeight = extraPicHeight;
      fitType = fitType;
    });
  }

  updateExpandedHeight(height){
    setState(() {
      expanedHeight=height;
    });
  }

  runAnimate() {
    setState(() {
      anim = Tween(begin: extraPicHeight, end: 0.0).animate(animationController)..addListener(() {
          if (extraPicHeight >= widget.rpx * 155) {
            fitType = BoxFit.cover;
          } else {
            fitType = BoxFit.cover;
          }
          setState(() {
            extraPicHeight = anim.value;
            fitType = fitType;
          });
        });
      prev_dy = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (result) {
        updatePicHeight(result.position.dy);
      },
      onPointerUp: (_) {
        runAnimate();
        animationController.forward(from: 0);
      },
      child: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned:true,
            floating: true,
  //          title: Text('会员中心'),
            centerTitle:true,
//            leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () {},),
            actions:<Widget>[
              IconButton(icon:Icon(Icons.more_horiz), onPressed: (){
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SharePage();
                  },
                );
              }),
            ],
            expandedHeight: 155+extraPicHeight,
//            flexibleSpace: Container(
//              child: TopBarWithCallback(
//                extraPicHeight: extraPicHeight,
//                fitType: fitType,
//                updateHeight: updateExpandedHeight,
//              ),
//            ),
            flexibleSpace: FlexibleSpaceBar(
                title: Text('会员中心',style: TextStyle(fontSize: 14),),
                centerTitle:true,
                background: SliverTopBar(extraPicHeight: extraPicHeight,fitType: fitType)
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
            return Column(
              children: <Widget>[
                  QubeWidget(),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0,0.0),
  //                          width: ScreenUtil().setWidth(710),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
  //                            border: Border(top: BorderSide(color: Color(0xfff5f5f5),width: 0),bottom: BorderSide(color: Color(0xfff5f5f5),width: 1))
                    ),
                    child: ListTileWidget(iconpic: Icons.room,titletxt: '收货地址',subtitle: '',id: 0),   //
                  ),//
                  ListTileWidget(iconpic: Icons.share,titletxt: '分享',subtitle: '邀请好友赢大礼',id: 1),   //
                  ListTileWidget(iconpic: Icons.smartphone,titletxt: '绑定手机',subtitle: '绑定手机',id: 1),//
                  ListTileWidget(iconpic: Icons.phone,titletxt: '联系客服',subtitle: '联系客服',id: 2),   //
                ],
            );
          }, childCount:1))
       ],
      )
    );
  }
}

class SliverTopBar extends StatelessWidget {
  SliverTopBar({Key key,this.extraPicHeight,this.fitType});
  final double extraPicHeight;
  final BoxFit fitType;

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Stack(
        children: <Widget>[
          new Image.asset('assets/images/temp/userbg.jpg',width: ScreenUtil().setWidth(750),
              height: 350+extraPicHeight,fit: fitType),
          new Positioned(
            top: 65.0+extraPicHeight,
            left: 10.0,
//              child: new CircleAvatar(
//                child: Image.asset('assets/images/icon/tab-cate-current.png',
//                  width: ScreenUtil().setWidth(100),height: ScreenUtil().setHeight(100),fit: BoxFit.cover),
//                radius: 100.0,
////                backgroundColor: Color(0xffffffff),
//              ),
            child:Icon(Icons.person,color:Color(0xfffa436a),size:60.0),
//            child: new Image.asset('assets/images/icon/tab-cate-current.png',
//                  width: ScreenUtil().setWidth(100),height: ScreenUtil().setHeight(100),fit: BoxFit.cover),
          ),
          new Positioned(
              top: 80.0+extraPicHeight,
              left: 70.0,
              child: new Text(
                '易强',
                style: TextStyle(color:Colors.white,fontSize: ScreenUtil().setSp(36)),
              )
          ),
        ]
    );
  }
}
