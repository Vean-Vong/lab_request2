import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request/auth/Register.dart';
import 'package:request/auth/login.dart';
import 'package:request/screens/About.dart';
import 'package:request/screens/EditProfile.dart';
import 'package:request/screens/EditScreen.dart';
import 'package:request/screens/HistoryRequest.dart';
import 'package:request/screens/Homepage.dart';
import 'package:request/screens/Language.dart';
import 'package:request/screens/Navigation.dart';
import 'package:request/screens/Notifiction.dart';
import 'package:request/screens/Request.dart';
import 'package:request/screens/Request_Detail.dart';
import 'package:request/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: "/Splash",
      routes: {
        "/": (context) => Navigation(),
        "/Splash": (context) => Splash(),
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
        "/Login": (context) => Login(),
      },
    );
  }
}
