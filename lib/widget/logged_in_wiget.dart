import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'app_drawer.dart';

class LoggedInPage extends StatelessWidget {
  const LoggedInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Center(
        child: Column(children: [
          // Text(user!.phoneNumber.toString()),
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(user!.photoURL!),
          ),
          Text(user.displayName!),
          Text(user.email!),
          // Text(user.emailVerified.toString()),
        ]),
      ),
    );
  }
}
