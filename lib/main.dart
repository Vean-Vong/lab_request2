import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controllers/request_controller.dart';
import 'language/my_translate.dart';
import 'services/session_service.dart';
import 'views/auth/login_screen.dart';
import 'views/auth/register_screen.dart';
import 'views/components/navigattion.dart';
import 'views/screens/about_screen.dart';
import 'views/screens/edit_profile.dart';
import 'views/screens/home_screen.dart';
import 'views/screens/language_screen.dart';
import 'views/screens/notifiction_screen.dart';
import 'views/screens/request_history.dart';
import 'views/screens/request_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the RequestService
  Get.put(RequestService());

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
