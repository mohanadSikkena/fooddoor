import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../models/mainModel.dart';
import '../../../widgets/recentResturant.dart';

class SavedResturant extends StatefulWidget {
  const SavedResturant({Key? key}) : super(key: key);

  @override
  _SavedResturantState createState() => _SavedResturantState();
}

class _SavedResturantState extends State<SavedResturant> {
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
