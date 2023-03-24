import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googlesignin/providers/user.dart';
import 'package:googlesignin/providers/google_sign_in.dart';
import 'package:googlesignin/screens/info_page.dart';
import 'package:googlesignin/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: GoogleSignInProvider()),
        ChangeNotifierProvider.value(
            value: SingleUser(userName: '', userEmail: '', userId: ''))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        // home: Consumer<User>(
        //   builder: ((context, value, child) {
        //     return value.isId
        //         ? InfoPage()
        //         : FutureBuilder(
        //             builder: ((context, snapshot) {
        //               return (snapshot.connectionState ==
        //                       ConnectionState.waiting)
        //                   ? Center(
        //                       child: CircularProgressIndicator(),
        //                     )
        //                   : LoginPage();
        //             }),
        //             future: value.checkUser());
        //   }),
        // ),
        home: FirebaseAuth.instance.currentUser == null
            ? LoginPage()
            : InfoPage(),
        routes: {
          InfoPage.routeName: (context) => InfoPage(),
        },
      ),
    );
  }
}
