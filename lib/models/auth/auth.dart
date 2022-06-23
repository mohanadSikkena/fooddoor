import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';

import '../mainModel.dart';
import '../shared.dart';

mixin Auth on Model {
  bool? _userSignedIn;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool notifications = false;
  bool promotionsNotifications = false;

  bool _signedInWithGoogle = false;

  bool get userSignedIn => _userSignedIn!;

  User? _user;

  User get getUser => _user!;

  /////////////////////////////////////////////////////////////////////////////

  initializeFirebase(MainModel model) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    FirebaseAuth.instance.currentUser == null
        ? _userSignedIn = false
        : {_userSignedIn = true, _user = FirebaseAuth.instance.currentUser};
    if (_user != null) {
      Shared.saveBoolData('loggedIn', true);
    }

    // return firebaseApp;
  }

  signInWithGoogle(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        _user = userCredential.user!;
        _userSignedIn = true;

        return _user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }
  }

  signOut() async {
    await _googleSignIn.isSignedIn() ? _googleSignIn.disconnect() : null;
    await FirebaseAuth.instance.signOut();
    _userSignedIn = false;

    notifyListeners();
  }

  signUpWithEmail(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    _user = userCredential.user;
  }

  signInWithEmail(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    _user = userCredential.user;
    notifyListeners();
  }

  changeNotifications() {
    notifications = !notifications;
    notifyListeners();
  }

  changePromotionsNotification() {
    promotionsNotifications = !promotionsNotifications;
    notifyListeners();
  }
}
