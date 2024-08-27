import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:ui';
import '../auth/login.dart';
import '../auth/register.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay of 3 seconds and then navigate based on user login status
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => Login());
    });
  }

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
                  'assets/images/nubb.png',
                  width: 120.0, // Adjust size as needed
                  height: 120.0,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Lab Request',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
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
