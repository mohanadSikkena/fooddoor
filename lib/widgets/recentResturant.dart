import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../Screens/resturantDetails.dart';
import '../models/mainModel.dart';
import '../models/resturant/resturantModel.dart';
import '../theme/Colors.dart';

class RecentResturant extends StatefulWidget {
  ResturantModel resturant;

  RecentResturant(this.resturant);
  @override
  _RecentResturantState createState() => _RecentResturantState();
}

class _RecentResturantState extends State<RecentResturant> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return InkWell(
        onTap: () {
          model.selectResturant(widget.resturant.id);
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResturantDetails();
          }));
        },
        child: Container(
          height: 120,
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.resturant.img),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.resturant.name}',
                          style: TextStyle(
                              color: mainFontColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            if (widget.resturant.favourite == true) {
                              model.removeFromFavourite(widget.resturant);
                            } else {
                              model.addToFavourite(widget.resturant);
                            }
                          },
                          icon: Icon(
                            widget.resturant.favourite == false
                                ? Icons.turned_in_not_outlined
                                : Icons.turned_in,
                            color: secondaryColor,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        iconAndText('${widget.resturant.type}',
                            Icons.info_outline, secondaryColor),
                        SizedBox(
                          width: 15,
                        ),
                        iconAndText('${widget.resturant.distance}',
                            Icons.place_outlined, thirdColor)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 16,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              '${widget.resturant.rate}',
                              style: TextStyle(
                                  color: mainFontColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        iconAndText('${widget.resturant.time}',
                            Icons.schedule_outlined, thirdColor),
                        iconAndText('Contact Us', Icons.phone_in_talk_outlined,
                            mainColor)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  iconAndText(String text, IconData icon, Color iconColor) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 16,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '$text',
          style: TextStyle(color: thirdColor, fontSize: 16),
        )
      ],
    );
  }
}
