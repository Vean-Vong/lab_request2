import 'package:flutter/material.dart';
import 'package:request/views/auth/Register.dart';
import 'package:request/views/auth/login.dart';
import 'package:request/views/screens/About.dart';
import 'package:request/views/screens/EditProfile.dart';
import 'package:request/views/screens/EditScreen.dart';
import 'package:request/views/screens/Language.dart';
import 'package:request/views/components/navigattion.dart';
import 'package:request/views/screens/Notifiction.dart';
import 'package:get/get.dart';
import 'package:request/views/screens/request_screen.dart';

import '../../controllers/data_selection_controller.dart';
import 'views/screens/home_screen.dart';
import 'views/screens/request_history.dart';

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
      initialRoute: "/",
      routes: {
        "/": (context) => Navigation(),
        "/Homepage": (context) => HomeScreen(),
        "/Request": (context) => Request(),
        "/EditProfile": (context) => EditProfile(),
        "/Language": (context) => Language(),
        "/Notification": (context) => Notifications(),
        "/About": (context) => About(),
        "/HistoryRequest": (context) => RequestHistory(),
        "/EditDetail": (context) => EditDetail(),
        "/Register": (context) => Register(),
        "/Login": (context) => Login(),
      },
    );
  }
}
