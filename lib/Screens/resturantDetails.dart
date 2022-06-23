import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/mainModel.dart';
import '../theme/Colors.dart';
import '../widgets/resturantMeals.dart';


class ResturantDetails extends StatefulWidget {
  @override
  _ResturantDetailsState createState() => _ResturantDetailsState();
}

class _ResturantDetailsState extends State<ResturantDetails> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return Scaffold(
          body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage('${model.selectedResturant!.img}'),
                      fit: BoxFit.fill)),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 27,
                          )),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search_outlined,
                                size: 27,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.ios_share_outlined,
                                size: 27,
                              ))
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                  )
                ],
              )),
          ListTile(
            title: Text(
              '${model.selectedResturant!.name}',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              onPressed: () {
                if (model.selectedResturant!.favourite == true) {
                  model.removeFromFavourite(model.selectedResturant!);
                } else {
                  model.addToFavourite(model.selectedResturant!);
                }
              },
              icon: Icon(
                model.selectedResturant!.favourite == false
                    ? Icons.turned_in_not_outlined
                    : Icons.turned_in,
                color: secondaryColor,
                size: 27,
              ),
            ),
          ),
          Row(
            children: [
              customText('\$\$'),
              customText('Burger'),
              customText('American Food'),
              customText('Deshi Food'),
            ],
          ),
          ListTile(
            horizontalTitleGap: 1,
            leading: Icon(
              Icons.star,
              color: Colors.yellow[800],
            ),
            title: Row(
              children: [
                Text(
                  '4.9',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\t\t200+ Ratings',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconAndText(Icons.monetization_on, mainColor, 'Free Delivery'),
              iconAndText(Icons.timer, Colors.blue, '30 min'),
              Container(
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(color: mainWidgetBackgroundColor),
                child: TextButton(
                  child: Text(
                    "Take Away",
                    style: TextStyle(color: secondaryColor),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
          // Container(
          //     margin: EdgeInsets.only(top: 10, left: 15, bottom: 10),
          //     height: 60,
          //     decoration: BoxDecoration(
          //         color: mainWidgetBackgroundColor,
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(30),
          //             bottomLeft: Radius.circular(30))),
          //     child: ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount: resturant.length,
          //         itemBuilder: (context, i) {
          //           return Align(
          //             alignment: Alignment.center,
          //             child: Container(
          //                 margin: EdgeInsets.all(15),
          //                 child: Text(
          //                   "${resturant[i]}",
          //                   style: TextStyle(
          //                       color: mainFontColor,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w500),
          //                 )),
          //           );
          //         })),
          for (int i = 0; i < model.selectedResturant!.meals.length; i++)
            Meal(model.selectedResturant!.meals[i])
        ],
      ));
    });
  }

  Text customText(String data) {
    return Text(
      "\t\t\t\t$data",
      style: TextStyle(
          color: thirdColor, fontSize: 15, fontWeight: FontWeight.bold),
    );
  }

  iconAndText(IconData icon, Color iconColor, String txt) {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Icon(
          icon,
          color: iconColor,
        ),
        Text('\t$txt')
      ],
    );
  }
}
