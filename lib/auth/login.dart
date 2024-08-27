import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request/auth/Register.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true, // Ensures resizing when keyboard appears
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Distributes space evenly between elements
          children: [
            Expanded(
              child: SingleChildScrollView(
                // Enables scrolling when keyboard is open
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo
                    Image.asset(
                      'assets/images/nubb.png',
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 10),
                    // Title
                    const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // Subtitle
                    const Text(
                      'Sign in as an admin',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    // Name text field
                    const CustomTextField(
                      label: 'Name',
                      hint: 'Enter your name',
                      keyboardType: TextInputType.name,
                      isPassword: false,
                      obsureText: false,
                    ),
                    const SizedBox(height: 10),
                    // Password text field
                    const CustomTextField(
                      label: 'Password',
                      hint: 'Enter your password',
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      obsureText: true,
                    ),
                    const SizedBox(height: 10),
                    // Forget password
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Login button
                    CustomButton(
                      color: Colors.black,
                      onPressed: () {
                        Get.offAllNamed('/Homepage');
                      },
                      text: 'Login',
                    ),
                  ],
                ),
              ),
            ),
            // Register prompt
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account yet?",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                TextButton(
                  onPressed: () {
                    Get.offAll(Register());
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
