import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../models/mainModel.dart';
import '../../../widgets/recentResturant.dart';

class SavedMeals extends StatefulWidget {
  const SavedMeals({Key? key}) : super(key: key);

  @override
  _SavedMealsState createState() => _SavedMealsState();
}

class _SavedMealsState extends State<SavedMeals> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return Container(
        child: ListView.builder(
            itemCount: model.allFavouriteResturant.length,
            itemBuilder: (context, i) {
              return RecentResturant(model.allFavouriteResturant[i]);
            }),
      );
    });
  }
}
