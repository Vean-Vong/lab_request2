import 'package:flutter/material.dart';
import 'package:request/pages/Register.dart';
import 'package:request/pages/login.dart';
import 'package:request/screens/About.dart';
import 'package:request/screens/EditProfile.dart';
import 'package:request/screens/EditScreen.dart';
import 'package:request/screens/HistoryRequest.dart';
import 'package:request/screens/Homepage.dart';
import 'package:request/screens/Language.dart';
import 'package:request/screens/Notifiction.dart';
import 'package:request/screens/Request.dart';
import 'package:request/screens/Request_Detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        "/Homepage": (context) => Homepage(),
        "/Request": (context) => Request(),
        "/EditProfile": (context) => EditProfile(),
        "/Language": (context) => Language(),
        "/Notification": (context) => Notifications(),
        "/About": (context) => About(),
        "/HistoryRequest": (context) => HistoryRequest(),
        "/RequestDetails": (context) => RequestDetails(),
        "/EditDetail": (context) => EditDetail(),
        "/Register": (context) => Register(),
      },
    );
  }
}
