import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:googlesignin/screens/login_screen.dart';
import 'package:googlesignin/widget/logged_in_wiget.dart';

class InfoPage extends StatelessWidget {
  static const routeName = '/info-page';
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong'),
          );
        } else if (snapshot.hasData) {
          return LoggedInPage();
        } else {
          return LoginPage();
        }
      }),
      stream: FirebaseAuth.instance.authStateChanges(),
    );
  }
}
