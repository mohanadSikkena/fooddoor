import 'package:flutter/material.dart';
import 'package:fooddoor/Screens/bottomNavigationBar/shoppingCart/cart.dart';

import '../../models/mainModel.dart';
import '../../theme/Colors.dart';
import 'HomePage.dart';
import 'account.dart';
import 'mySaved/mySaved.dart';
import 'nearMe.dart';


class BottomNavBar extends StatefulWidget {
  final MainModel model;
  BottomNavBar(this.model);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      HomePage(widget.model),
      NearMe(widget.model),
      ShoppingCart(),
      MySaved(),
      ProfileScreen()
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavigationBar, body: bodyContent);
  }

  Widget get bodyContent {
    return screens[currentIndex];
  }

  Widget get bottomNavigationBar {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(),
        boxShadow: [
          BoxShadow(
              offset: Offset(0.0, 1.00), //(x,y)
              blurRadius: 4.00,
              color: Colors.grey,
              spreadRadius: 1.00),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: '.'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined), label: '.'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: '.'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined), label: '.'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: '.'),
          ],
          backgroundColor: Colors.white,
          unselectedItemColor: thirdColor,
          selectedItemColor: mainColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
