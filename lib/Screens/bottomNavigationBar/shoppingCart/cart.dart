
import 'package:flutter/material.dart';

import '../../../theme/Colors.dart';
import 'onComing.dart';

import 'preorder.dart';
import 'history.dart';


class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 1, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "\nMy Orders",
          style: TextStyle(color: mainFontColor, fontSize: 20),
        ),
        bottom: PreferredSize(
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: Text('Pr-Orders')),
              Text('Oncoming'),
              Text("History")
            ],
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: mainColor, width: .9)),
            controller: tabController,
            labelColor: mainColor,
            labelStyle: TextStyle(color: Colors.white, fontSize: 18),
            unselectedLabelColor: thirdColor,
            unselectedLabelStyle: TextStyle(color: thirdColor, fontSize: 18),
          ),
          preferredSize: Size(0.0, 60.0),
        ),
      ),
      body: Container(
        child: TabBarView(
            controller: tabController,
            children: const [Preorder(), OnComing(), History()]),
      ),
    );
  }
}
