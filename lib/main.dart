import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controllers/request_controller.dart';
import 'language/my_translate.dart';
import 'middlewares/auth_middleware.dart';
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
      initialRoute: "/Login",
      getPages: [
        GetPage(name: "/", page: () => Navigation()),
        GetPage(name: "/Homepage", page: () => HomeScreen()),
        GetPage(name: "/Request", page: () => RequestScreen()),
        GetPage(name: "/EditProfile", page: () => EditProfile()),
        GetPage(name: "/Language", page: () => Language()),
        GetPage(name: "/Notification", page: () => Notifications()),
        GetPage(name: "/About", page: () => About()),
        GetPage(name: "/HistoryRequest", page: () => RequestHistory()),
        GetPage(
          name: "/Register",
          page: () => Register(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(name: "/Login", page: () => Login()),
      ],
    );
  }

  TextTheme _getTextTheme() {
    return Get.locale?.languageCode == 'km'
        ? ThemeData.light().textTheme.apply(fontFamily: 'NotoSansKhmer')
        : ThemeData.light().textTheme.apply(fontFamily: 'Roboto');
  }
}
