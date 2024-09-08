import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:request/views/auth/register_screen.dart';
import 'package:request/views/auth/login_screen.dart';
import 'package:request/views/screens/about_screen.dart';
import 'package:request/views/screens/edit_profile.dart';
import 'package:request/views/screens/language_screen.dart';
import 'package:request/views/components/navigattion.dart';
import 'package:request/views/screens/notifiction_screen.dart';
import 'package:get/get.dart';

import '../../controllers/data_selection_controller.dart';
import 'language/my_translate.dart';
import 'views/screens/home_screen.dart';
import 'views/screens/request_history.dart';
import 'views/screens/request_screen.dart';

void main() {
  Get.put(DateSelectionController());
  // Lock the app to portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: "/",
      routes: {
        "/": (context) => Navigation(),
        "/Homepage": (context) => HomeScreen(),
        "/Request": (context) => RequestScreen(),
        "/EditProfile": (context) => EditProfile(),
        "/Language": (context) => Language(),
        "/Notification": (context) => Notifications(),
        "/About": (context) => About(),
        "/HistoryRequest": (context) => RequestHistory(),
        "/Register": (context) => Register(),
        "/Login": (context) => Login(),
      },
    );
  }

  TextTheme _getTextTheme() {
    return Get.locale?.languageCode == 'km'
        ? ThemeData.light().textTheme.apply(fontFamily: 'NotoSansKhmer')
        : ThemeData.light().textTheme.apply(fontFamily: 'Roboto');
  }
}
