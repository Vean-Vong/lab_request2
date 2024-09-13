import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request_user/controllers/auth_controller.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'register_screen.dart';

class Login extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/nubb.png",
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            letterSpacing: 2),
                      ),
                      Text(
                        "SignIn to continue... ",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    // email
                    CustomTextField(
                      controller: emailController,
                      label: 'Email',
                      hint: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      isPassword: false,
                      obscureText: false,
                    ),
                    SizedBox(height: 20),
                    // password
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      hint: 'Enter your Password',
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      obscureText: true,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Forgot your password?"),
                          TextButton(onPressed: () {}, child: Text("Here"))
                        ],
                      ),
                    ),
                    Obx(() {
                      return authController.isLoading.value
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              color: Colors.black,
                              onPressed: () {
                                authController.login(
                                  emailController.text,
                                  passwordController.text,
                                );
                              },
                              text: 'Login',
                            );
                    }),
                    SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                              onPressed: () {
                                Get.offAll(() => Register());
                              },
                              child: Text("Sign up"))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
