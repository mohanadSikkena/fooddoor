import 'package:flutter/material.dart';
import 'package:fooddoor/Screens/SignupAndLogIn/signUp.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/mainModel.dart';
import '../../theme/Colors.dart';
import '../../widgets/button.dart';
import '../../widgets/custonTextField.dart';
import '../bottomNavigationBar/BottomNavigationBar.dart';
class Login extends StatefulWidget {
  final MainModel model;
  Login(this.model);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> mainKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  bool obSecurePassword = true;
  bool rememberMe = true;

  @override
  void initState() {
    widget.model.initializeFirebase(widget.model);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
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
            'Login',
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
                '\n \tWelcome To Food Door',
                style: TextStyle(
                  color: mainFontColor,
                  fontSize: 25,
                ),
              ),
              Text(
                '\n \t\tEnter your phone number or email \n \t\taddress for sign in.Enjoy your food',
                style: TextStyle(
                  color: mainFontColor,
                  fontSize: 18,
                ),
              ),
              customTextField('Email', Icons.person_outline,
                  TextInputType.emailAddress, emailKey, emailController),
              customTextField('Password', Icons.lock, TextInputType.text,
                  passwordKey, passwordController,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Switch(
                        activeColor: mainColor,
                        value: rememberMe,
                        onChanged: (bool newValue) {
                          setState(() {
                            rememberMe = newValue;
                          });
                        }),
                    Text(
                      "remember me",
                      style: TextStyle(color: thirdColor),
                    ),
                  ]),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: mainColor),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 55,
                margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                child: CustomButton("Log in", () async {
                  model.signInWithEmail(
                      emailController.text, passwordController.text);
                  if (model.getUser != null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return BottomNavBar(model);
                    }));
                  }
                }),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .5)),
                height: 55,
                margin: EdgeInsets.only(top: 70, left: 20, right: 20),
                child: TextButton(
                    onPressed: () async {
                      await model.signInWithGoogle(context);

                      if (model.getUser != null) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) {
                          return BottomNavBar(model);
                        }));
                      }
                    },
                    child: Text(
                      "Sign in with Google",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff1877F2),
                    border: Border.all(color: Colors.black, width: .5)),
                height: 55,
                margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Continue with Facebook",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\ndont have an account?",
                    style: TextStyle(color: mainFontColor, fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return SignUp(widget.model);
                      }));
                    },
                    child: Text(
                      "\nSign up",
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
