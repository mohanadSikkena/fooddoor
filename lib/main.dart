import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Screens/flutterLoadingScreen.dart';
import 'models/mainModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          return MaterialApp(home: LoadingScreen(model, context));
        },
      ),
    );
  }
}
