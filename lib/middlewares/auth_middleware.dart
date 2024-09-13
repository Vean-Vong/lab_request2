import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthController authController = Get.put(AuthController());

  @override
  RouteSettings? redirect(String? route) {
    if (authController.user.value.token.isEmpty) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}
