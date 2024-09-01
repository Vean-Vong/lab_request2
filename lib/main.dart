import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request/views/auth/Register.dart';
import 'package:request/views/auth/login.dart';
import 'package:request/views/About.dart';
import 'package:request/views/EditProfile.dart';
import 'package:request/views/EditScreen.dart';
import 'package:request/views/HistoryRequest.dart';
import 'package:request/views/Homepage.dart';
import 'package:request/views/Language.dart';
import 'package:request/views/Notifiction.dart';
import 'package:request/views/Request.dart';
import 'package:request/views/Request_Detail.dart';
import 'controllers/controller.dart'; 

void main() {
  // Initialize the GetX controller
  Get.put(SelectionController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
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
