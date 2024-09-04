import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'package:get/get.dart';

import '../auth/login_screen.dart';
import '../components/navigattion.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // _checkLoginStatus();
  }

  // Future<void> _checkLoginStatus() async {
  //   // Simulate a delay of 3 seconds before checking login status
  //   await Future.delayed(const Duration(seconds: 3));

  //   // Fetch user login status, for example from SharedPreferences (replace this logic based on your app's logic)

  //   if (userLoggedIn) {
  //     // Navigate to HomePage (Navigation)
  //     Get.offAll(() => Navigation());
  //   } else {
  //     // Navigate to LoginPage
  //     Get.offAll(() => Login());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image with blur
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/nubb_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          // Logo and Text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/nubb_logo.png',
                  width: 120.0, // Adjust size as needed
                  height: 120.0,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Lab Request\nAdmin',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
