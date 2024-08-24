import 'package:flutter/material.dart';
import 'package:request/screens/About.dart';
import 'package:request/screens/EditProfile.dart';
import 'package:request/screens/HistoryRequest.dart';
import 'package:request/screens/Homepage.dart';
import 'package:request/screens/Language.dart';
import 'package:request/screens/Navigation.dart';
import 'package:request/screens/Notifiction.dart';
import 'package:request/screens/Request.dart';

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
        "/": (context) => Navigation(),
        "/Homepage": (context) => Homepage(),
        "/Request": (context) => Request(),
        "/EditProfile": (context) => EditProfile(),
        "/Language": (context) => Language(),
        "/Notification": (context) => Notifications(),
        "/About": (context) => About(),
        "/HistoryRequest": (context) => HistoryRequest(),
      },
    );
  }
}
