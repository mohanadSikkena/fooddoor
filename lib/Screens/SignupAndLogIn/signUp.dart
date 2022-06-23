import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/mainModel.dart';
import '../../theme/Colors.dart';
import '../../widgets/button.dart';
import '../../widgets/custonTextField.dart';
import '../bottomNavigationBar/BottomNavigationBar.dart';

class SignUp extends StatefulWidget {
  final MainModel model;
  SignUp(this.model);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  GlobalKey<FormState> userKey = GlobalKey<FormState>();
  GlobalKey<FormState> mainKey = GlobalKey<FormState>();
  bool obSecurePassword = true;
  bool rememberMe = true;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) {
                    return BottomNavBar(widget.model);
                  }));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: mainFontColor, fontSize: 17),
                ),
              ),
            )
          ],
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Sign UP',
            style: TextStyle(
                color: mainFontColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          key: mainKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Text(
                '\n \tCreate Account',
                style: TextStyle(
                  color: mainFontColor,
                  fontSize: 25,
                ),
              ),
              Text(
                '\n \t\tEnter your Name,Email and Password \n \t\tfor sign up ',
                style: TextStyle(
                  color: mainFontColor,
                  fontSize: 18,
                ),
              ),
              customTextField('Useer Name', Icons.person_outline,
                  TextInputType.text, userKey, userController),
              customTextField('Email', Icons.email_outlined,
                  TextInputType.emailAddress, emailKey, emailController),
              customTextField('Password', Icons.lock_outline,
                  TextInputType.text, passwordKey, passwordController,
                  obSecure: obSecurePassword,
                  suffex: IconButton(
                      onPressed: () {
                        setState(() {
                          obSecurePassword = !obSecurePassword;
                        });
                      },
                      icon: Icon(
                        obSecurePassword == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: thirdColor,
                      ))),
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                child: CustomButton("Create Account", () {
                  if (!mainKey.currentState!.validate()) {
                    print('hello');
                  } else {
                    model.signUpWithEmail(
                        emailController.text, passwordController.text);
                  }
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\nAlready have account?",
                    style: TextStyle(color: mainFontColor, fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "\nSign In",
                      style: TextStyle(color: mainColor, fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
