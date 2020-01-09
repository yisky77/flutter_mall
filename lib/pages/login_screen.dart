import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_navigation_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget logoSection() {
      // Hero 动画
      return Hero(
        tag: 'logo',
        child: Image.asset(
            "assets/icon/logo.png",
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setWidth(150),
        ),
//        transitionOnUserGestures: true,
      );
    }

    Widget inputSection() {
      return Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              // 提示文本
              hintText: "手机号",
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "密码",
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            // 隐藏文本
            obscureText: true,
          ),
        ],
      );
    }
    _gohome() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('ishome',true);
//      prefs.clear();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>BottomNavigationWidget()), (route)=> route==null);
    }

    Widget loginSection() {
      return FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          _gohome();
        },
        child: Container(
          height: 52.0,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xfffa436a),
            borderRadius: new BorderRadius.circular(30.0),
          ),
          child: Text(
            "登录",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    Widget labelSection() {
      return FlatButton(
        child: Text(
          "忘记密码？",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        onPressed: () {
          Fluttertoast.showToast(
              msg: "请稍后",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Color.fromARGB(100,0,0,0),
              textColor: Colors.white,
              fontSize: 16.0
          );
        },
      );
    }

    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
        title: Text('登录'),
        centerTitle:true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logoSection(),
              SizedBox( height: 30.0,),
              inputSection(),
              SizedBox(
                height: 24.0,
              ),
              loginSection(),
              labelSection(),
            ],
          ),
        ),
      ),
    );
  }
}