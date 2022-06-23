import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/mainModel.dart';
import '../../models/resturant/resturantModel.dart';
import '../../theme/Colors.dart';
import '../../theme/curveClipper.dart';
import '../../widgets/custonTextField.dart';
import '../../widgets/favouriteResturant.dart';
import '../../widgets/recentResturant.dart';
import '../categoryDetails.dart';
import '../filterSearch.dart';

class HomePage extends StatefulWidget {
  final MainModel model;
  HomePage(this.model);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   widget.model.getResturants();
  //   // widget.model.getFavouriteResturants();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Row(
            children: [
              Icon(
                Icons.location_pin,
                color: thirdColor,
                size: 17,
              ),
              Text(
                "  Delivered to",
                style: TextStyle(color: thirdColor, fontSize: 15),
              ),
              Text(
                "   Home",
                style: TextStyle(color: secondaryColor, fontSize: 15),
              ),
              Icon(
                Icons.expand_more,
                color: secondaryColor,
                size: 22,
              )
            ],
          ),
          backgroundColor: mainColor,
          actions: [
            Icon(
              Icons.notifications_outlined,
              size: 28,
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: model.getResturants,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ClipPath(
                  clipper: CurveClipper(),
                  child: Container(
                    height: 160,
                    color: mainColor,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          child: customTextField('Search...', Icons.search,
                              TextInputType.text, searchKey, searchController,
                              suffex: IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return FilterSearch();
                                  }));
                                },
                                icon: Icon(
                                  Icons.tune,
                                  color: secondaryColor,
                                ),
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            items("Pizza", Icons.local_pizza_outlined),
                            items("burger", Icons.lunch_dining),
                            items("brakfast", Icons.ramen_dining),
                            items("coffe", Icons.coffee),
                            items("drink", Icons.wine_bar),
                          ],
                        ),
                      ],
                    ),
                  )),
              ListTile(
                title: Text(
                  "Favourite",
                  style: TextStyle(
                      color: mainFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "See all",
                  style: TextStyle(color: secondaryColor, fontSize: 17),
                ),
              ),
              Container(
                  height: 280,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.allFavouriteResturant.length,
                      itemBuilder: (context, i) {
                        return FavoruiteResturant(
                            model.allFavouriteResturant[i]);
                      })),
              for (ResturantModel resturant in model.allResturants)
                RecentResturant(resturant)
            ],
          ),
        ),
      );
    });
  }

  items(String itemName, IconData iconName) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return CategoryDetails(itemName);
          }));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(
                iconName,
                size: 35,
              ),
              Text(
                "$itemName",
                style: TextStyle(color: thirdColor, fontSize: 17),
              ),
            ],
          ),
        ));
  }
}
