import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/mainModel.dart';
import 'SignupAndLogIn/logIn.dart';
import 'bottomNavigationBar/BottomNavigationBar.dart';

class LoadingScreen extends StatefulWidget {
  MainModel model;
  BuildContext context;
  LoadingScreen(this.model, this.context);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    onStart();

    widget.model.getFavouriteResturants();
    super.initState();
  }

  onStart() async {
    await widget.model.initializeFirebase(widget.model);
    await widget.model.getResturants();


    await widget.model.getFavouriteResturants();
    widget.model.userSignedIn
        ? Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return BottomNavBar(widget.model);
          }))
        : Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return Login(widget.model);
          }));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return Scaffold(
          body: Container(
              alignment: Alignment.center, child: CircularProgressIndicator()));
    });
  }
}
