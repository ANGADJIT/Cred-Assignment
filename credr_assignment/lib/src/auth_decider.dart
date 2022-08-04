import 'package:credr_assignment/src/presentation/pages/home.dart';
import 'package:credr_assignment/src/presentation/pages/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthDecider extends StatelessWidget {
  const AuthDecider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return Home();
    }

    return SignIn();
  }
}
