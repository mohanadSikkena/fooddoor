import 'package:flutter/material.dart';

import '../theme/Colors.dart';

class CustomButton extends StatefulWidget {
  final String txt;
  final Function onTap;
  CustomButton(this.txt, this.onTap);
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.onTap();
      },
      child: Text(
        "${widget.txt}",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      style: TextButton.styleFrom(
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
    );
  }
}
