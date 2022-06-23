import 'package:flutter/material.dart';

import '../theme/Colors.dart';

Container customTextField(String txt, IconData mainIcon, TextInputType type,
    Key key, TextEditingController controller,
    {bool obSecure = false, Widget? suffex}) {
  return Container(
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      controller: controller,
      key: key,
      validator: (value) {
        if (value!.isEmpty) {
          return "this field required";
        }
      },
      keyboardType: type,
      cursorColor: mainFontColor,
      obscureText: obSecure,
      decoration: InputDecoration(
          prefixIcon: Icon(
            mainIcon,
            color: thirdColor,
          ),
          suffixIcon: suffex,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.red, width: 0.5)),
          labelText: '$txt',
          labelStyle:
              TextStyle(color: thirdColor, fontWeight: FontWeight.bold)),
    ),
  );
}
