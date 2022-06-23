import 'package:flutter/material.dart';

import '../models/meal/mealModel.dart';
import '../theme/Colors.dart';

class Meal extends StatefulWidget {
  MealModel meal;
  Meal(this.meal);
  @override
  _MealState createState() => _MealState();
}

class _MealState extends State<Meal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      height: 110,
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage('${widget.meal.img}'),
                    fit: BoxFit.fill)),
          ),
          Container(
              padding: EdgeInsets.all(0),
              color: Colors.white,
              width: MediaQuery.of(context).size.width - 150,
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('${widget.meal.name}'),
                      subtitle: Text('sub Burger'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.meal.price}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.add_circle,
                          color: secondaryColor,
                          size: 30,
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
