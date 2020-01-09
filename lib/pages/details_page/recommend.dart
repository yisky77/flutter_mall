import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home_widget/hotGoodsList.dart';
import '../../provide/details_info.dart';

class recommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hotGoodsList = Provider.of<DetailsInfoProvide>(context, listen: false).hotGoodsList;
    return Container(
      child: HotGoods(hotGoodsList),
    );
  }
}
