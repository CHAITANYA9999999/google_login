import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/google_sign_in.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListTile(
        leading: Icon(Icons.logout),
        title: Text('Logout'),
        onTap: (() {
          Provider.of<GoogleSignInProvider>(context, listen: false).logOut();
        }),
      ),
    );
  }
}
