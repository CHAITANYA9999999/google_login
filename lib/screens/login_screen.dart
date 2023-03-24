import 'package:flutter/material.dart';
import 'package:googlesignin/providers/google_sign_in.dart';
import 'package:googlesignin/screens/info_page.dart';
import 'package:googlesignin/widget/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: FloatingActionButton.extended(
                  onPressed: (() async {
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      await provider.googleLogin();
                      final user =
                          Provider.of<SingleUser>(context, listen: false);
                      user.addUser(provider.user!);
                      print('\n\n' + provider.user.toString() + '\n\n');
                    } catch (e) {
                      print('\n' + e.toString() + '\n\n\n');
                    } finally {
                      setState(() {
                        _isLoading = false;
                      });
                    }

                    Navigator.of(context)
                        .pushReplacementNamed(InfoPage.routeName);
                  }),
                  label: Text('Sign in with google'))),
    );
  }
}
