import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleUser with ChangeNotifier {
  String? userName;
  String? userEmail;
  String? userId;

  bool get isId {
    return !(userId == null || userId == '');
  }

  SingleUser(
      {required this.userName, required this.userEmail, required this.userId});

  void addUser(GoogleSignInAccount user) async {
    userName = user.displayName!;
    userEmail = user.email;
    userId = user.id;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final userData = json
        .encode({'Id': userId, 'userName': userName, 'userEmail': userEmail});
    prefs.setString('userData', userData);
  }

  Future<bool> checkUser() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('Id')) {
      print('false');
      return false;
    }
    final extractedData = json.decode(prefs.getString('userData')!);
    userName = extractedData['userName'];
    userId = extractedData['userId'];
    userEmail = extractedData['userEmail'];
    print(userName! + "\n" + userId! + "\n" + userEmail!);
    notifyListeners();
    return true;
  }
}
