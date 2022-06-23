import 'package:flutter/material.dart';

import '../../models/mainModel.dart';

class NearMe extends StatefulWidget {
  final MainModel model;
  NearMe(this.model);

  @override
  _NearMeState createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Near Me"),
      ),
    );
  }
}
