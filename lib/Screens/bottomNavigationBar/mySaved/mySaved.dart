import 'package:flutter/material.dart';
import 'package:fooddoor/Screens/bottomNavigationBar/mySaved/savedMeals.dart';
import 'package:fooddoor/Screens/bottomNavigationBar/mySaved/savedResturant.dart';

import '../../../theme/Colors.dart';


class MySaved extends StatefulWidget {
  @override
  _MySavedState createState() => _MySavedState();
}

class _MySavedState extends State<MySaved> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
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
          "\nMy Saved",
          style: TextStyle(color: mainFontColor, fontSize: 20),
        ),
        bottom: PreferredSize(
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: Text('Resturants')),
              Text('meals')
            ],
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: mainColor),
            controller: tabController,
            labelColor: Colors.white,
            labelStyle: TextStyle(color: Colors.white, fontSize: 18),
            unselectedLabelColor: mainFontColor,
            unselectedLabelStyle: TextStyle(color: mainFontColor, fontSize: 18),
          ),
          preferredSize: Size(0.0, 60.0),
        ),
      ),
      body: Container(
        child: TabBarView(
            controller: tabController,
            children: const [SavedResturant(), SavedMeals()]),
      ),
    );
  }
}
