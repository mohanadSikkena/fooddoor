import 'package:flutter/material.dart';

import '../theme/Colors.dart';

class CategoryDetails extends StatefulWidget {
  final String title;
  CategoryDetails(this.title);
  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: mainFontColor),
        ),
        elevation: 0.0,
        backgroundColor: mainColor,
        iconTheme: IconThemeData(color: thirdColor),
      ),
    );
  }
}
