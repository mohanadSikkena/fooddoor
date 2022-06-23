import 'package:flutter/material.dart';

import '../theme/Colors.dart';
import 'button.dart';

class OrderMeals extends StatefulWidget {
  const OrderMeals({Key? key}) : super(key: key);

  @override
  _OrderMealsState createState() => _OrderMealsState();
}

class _OrderMealsState extends State<OrderMeals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: NetworkImage(
                          "https://th.bing.com/th/id/R.c003e301d825ca7d267beb48924dd78d?rik=1InuTgmyNnoivQ&pid=ImgRaw&r=0",
                        ),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width - 120,
                child: ListTile(
                  subtitle: Text(
                    "\n${DateTime.now().toString().substring(0, 16)}",
                    style: TextStyle(color: thirdColor, fontSize: 16),
                  ),
                  title: Text(
                    "Cheese Burger",
                    style: TextStyle(
                        color: mainFontColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "150\$",
                    style: TextStyle(color: secondaryColor, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 60,
                    width: (MediaQuery.of(context).size.width - 80) / 2,
                    margin: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                    child: CustomButton("Reorder", () {})),
                Container(
                  width: (MediaQuery.of(context).size.width - 80) / 2,
                  margin: const EdgeInsets.all(10),
                  height: 60,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[100],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Text(
                        "Get Help",
                        style: TextStyle(color: Colors.grey[600], fontSize: 18),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
