import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/mainModel.dart';
import '../../theme/Colors.dart';
import '../../theme/curveClipper.dart';
import '../SignupAndLogIn/logIn.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size(0.0, 20),
            child: SizedBox(),
          ),
          elevation: 0.0,
          backgroundColor: mainColor,
          centerTitle: true,
          title: Text("Profile"),
        ),
        body: model.userSignedIn
            ? ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: 270,
                    child: Stack(children: [
                      ClipPath(
                          clipper: CurveClipper(),
                          child: Container(
                            alignment: Alignment.topLeft,
                            height: 200,
                            color: mainColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  maxRadius: 45,
                                  backgroundImage:
                                      NetworkImage('${model.getUser.photoURL}'),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: ListTile(
                                    title: Text('${model.getUser.displayName}'),
                                    subtitle: Text("${model.getUser.email}"),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                          right: 20,
                          left: 20,
                          height: 150,
                          top: 120,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 5.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  customTextAndIcon(
                                      "\tMy All \n\tOrder",
                                      Icon(
                                        Icons.location_pin,
                                        size: 30,
                                      )),
                                  customTextAndIcon(
                                      "\tOffer & \n\tPromos",
                                      Icon(
                                        Icons.location_pin,
                                        size: 30,
                                      )),
                                  customTextAndIcon(
                                      "Delivery Address",
                                      Icon(
                                        Icons.location_pin,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ),
                          ))
                    ]),
                  ),
                  Container(
                    height: 500,
                    margin: EdgeInsets.all(20),
                    child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\n\t\t\t\tMy Account",
                              style:
                                  TextStyle(color: mainFontColor, fontSize: 18),
                            ),
                            customListTile(
                              Icons.person_outline,
                              "Manage Profile",
                              Icon(
                                Icons.arrow_right,
                                color: thirdColor,
                              ),
                            ),
                            customListTile(
                              Icons.payments_outlined,
                              "Payment",
                              Icon(
                                Icons.arrow_right,
                                color: thirdColor,
                              ),
                            ),
                            Text(
                              "\n\t\t\t\tNotifications",
                              style:
                                  TextStyle(color: mainFontColor, fontSize: 18),
                            ),
                            customListTile(
                                Icons.notifications_outlined,
                                "Notification",
                                Switch(
                                    activeColor: mainColor,
                                    value: model.notifications,
                                    onChanged: (bool newValue) {
                                      model.changeNotifications();
                                    })),
                            customListTile(
                                Icons.notifications_outlined,
                                "Promotions Notifications",
                                Switch(
                                    activeColor: mainColor,
                                    value: model.promotionsNotifications,
                                    onChanged: (bool newValue) {
                                      model.changePromotionsNotification();
                                    })),
                            Text(
                              "\n\t\t\t\tMore",
                              style:
                                  TextStyle(color: mainFontColor, fontSize: 18),
                            ),
                            ListTile(
                              onTap: () {
                                model.signOut();
                              },
                              leading: Icon(
                                Icons.logout_outlined,
                                color: mainColor,
                              ),
                              title: Text(
                                "Log Out",
                                style: TextStyle(
                                  color: mainFontColor,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              )
            : ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: 100,
                    child: TextButton(
                      child: Text("Login"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Login(model);
                        }));
                      },
                    ),
                  )
                ],
              ),
      );
    });
  }

  customTextAndIcon(String txt, Icon icon) {
    return Container(
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.yellow,
            child: icon,
          ),
          Text(
            "$txt",
            style: TextStyle(
              color: mainFontColor,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  customListTile(IconData icon, String txt, Widget widget) {
    return ListTile(
        leading: Icon(
          icon,
          color: mainColor,
        ),
        title: Text(
          txt,
          style: TextStyle(color: thirdColor),
        ),
        trailing: widget);
  }
}
