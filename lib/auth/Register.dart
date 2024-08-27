import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'login.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true, // Ensures resizing when keyboard appears
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes space evenly
          children: [
            Expanded(
              child: SingleChildScrollView( // Enables scrolling when the keyboard appears
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
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // Sub-title
                    const Text(
                      'Create an account to continue...',
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
                    // Phone text field
                    const CustomTextField(
                      label: 'Phone Number',
                      hint: 'Your Phone Number',
                      keyboardType: TextInputType.number,
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
                    // Register button
                    CustomButton(
                      color: Colors.black,
                      onPressed: () {},
                      text: 'Register',
                    ),
                  ],
                ),
              ),
            ),
            // Already have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                TextButton(
                  onPressed: () {
                    Get.offAll(Login());
                  },
                  child: const Text(
                    'Login',
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
