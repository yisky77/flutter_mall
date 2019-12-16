import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('购物车'),
          centerTitle:true,
        ),
        body:Center(
          child: new Column(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(top:200),
                child: Provide<Counter>(
                  builder: (context,child,counter){
                    return Text('${counter.value}');
                  },
                )
              ),
              new Container(
                child: RaisedButton(
                  onPressed: () {
                    Provide.value<Counter>(context).increate();
                  },
                  child: Text('点击递增'),
                ),
              )
            ],
          ),
        )
    );
  }
}



