import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../models/mainModel.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return Container(
        color: Colors.white,
      );
    });
  }
}
