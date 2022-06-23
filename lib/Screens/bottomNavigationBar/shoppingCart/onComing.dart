import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../models/mainModel.dart';
import '../../../widgets/orderWidget.dart';

class OnComing extends StatefulWidget {
  const OnComing({Key? key}) : super(key: key);

  @override
  _OnComingState createState() => _OnComingState();
}

class _OnComingState extends State<OnComing> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              return OrderMeals();
            }),
      );
    });
  }
}
