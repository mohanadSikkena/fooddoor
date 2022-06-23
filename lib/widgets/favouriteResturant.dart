import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../Screens/resturantDetails.dart';
import '../models/mainModel.dart';
import '../models/resturant/resturantModel.dart';
import '../theme/Colors.dart';


class FavoruiteResturant extends StatefulWidget {
  ResturantModel resturantModel;
  FavoruiteResturant(this.resturantModel);

  @override
  _FavoruiteResturantState createState() => _FavoruiteResturantState();
}

class _FavoruiteResturantState extends State<FavoruiteResturant> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return InkWell(
        onTap: () {
          model.selectResturant(widget.resturantModel.id);
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ResturantDetails();
          }));
        },
        child: Container(
          margin: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width * 4 / 5,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: (MediaQuery.of(context).size.width * 4 / 5) - 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.resturantModel.img),
                          fit: BoxFit.fill),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                Text(
                  widget.resturantModel.name, //name
                  style: TextStyle(color: mainFontColor, fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customText(widget.resturantModel.type), //type
                    const SizedBox(
                      width: 20,
                    ),
                    customText(
                        widget.resturantModel.resturantType), //resturant type
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        Text(
                          widget.resturantModel.rate, //rate
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' (${widget.resturantModel.numberOfRates})', //number of rates
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        iconAndText(Icons.place_outlined,
                            widget.resturantModel.distance), //distance
                        iconAndText(
                            Icons.timer, widget.resturantModel.time) //time
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  customText(String data) {
    return Text(
      data,
      style: TextStyle(
          color: thirdColor, fontWeight: FontWeight.bold, fontSize: 14),
    );
  }

  iconAndText(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: mainWidgetBackgroundColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: secondaryColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(color: secondaryColor),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
