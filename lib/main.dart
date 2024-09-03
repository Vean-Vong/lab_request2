import 'package:flutter/material.dart';
import 'package:request/pages/Register.dart';
import 'package:request/pages/login.dart';
import 'package:request/screens/About.dart';
import 'package:request/screens/EditProfile.dart';
import 'package:request/screens/EditScreen.dart';
import 'package:request/screens/HistoryRequest.dart';
import 'package:request/screens/Language.dart';
import 'package:request/screens/Navigation.dart';
import 'package:request/screens/Notifiction.dart';
import 'package:request/views/screens/request_screen.dart';
import 'package:request/screens/Request_Detail.dart';
import 'package:get/get.dart';

import 'views/screens/home_screen.dart';
import '../../controllers/data_selection_controller.dart';

void main() {
  Get.put(DateSelectionController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: "/Homepage",
      routes: {
        "/": (context) => Navigation(),
        "/Homepage": (context) => HomeScreen(),
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
