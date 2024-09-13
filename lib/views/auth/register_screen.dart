import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class Register extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController facultyController = TextEditingController();
  final TextEditingController positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 90),
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
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            letterSpacing: 2),
                      ),
                      Text(
                        "Create an account to continue... ",
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
                    // name
                    CustomTextField(
                      controller: nameController,
                      label: 'Name',
                      hint: 'Enter your name',
                      keyboardType: TextInputType.name,
                      isPassword: false,
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
                    // gender
                    CustomTextField(
                      controller: genderController,
                      label: 'Gender',
                      hint: 'Enter your gender',
                      keyboardType: TextInputType.name,
                      isPassword: false,
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
                    // email
                    CustomTextField(
                      controller: emailController,
                      label: 'Email',
                      hint: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      isPassword: false,
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
                    // phone
                    CustomTextField(
                      controller: phoneController,
                      label: 'Phone',
                      hint: 'Enter your phone number',
                      keyboardType: TextInputType.phone,
                      isPassword: false,
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
                    // password
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      hint: 'Enter your password',
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      obscureText: true,
                    ),
                    SizedBox(height: 10),

                    // department
                    CustomTextField(
                      controller: departmentController,
                      label: 'Department',
                      hint: 'Enter your department',
                      keyboardType: TextInputType.name,
                      isPassword: false,
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
                    // faculty
                    CustomTextField(
                      controller: facultyController,
                      label: 'Faculty',
                      hint: 'Enter your faculty',
                      keyboardType: TextInputType.name,
                      isPassword: false,
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
                    // position
                    CustomTextField(
                      controller: positionController,
                      label: 'Position',
                      hint: 'Enter your position',
                      keyboardType: TextInputType.name,
                      isPassword: false,
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
                    Obx(() {
                      return authController.isLoading.value
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              color: Colors.black,
                              onPressed: () {
                                authController.register(
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  phoneController.text,
                                  genderController.text,
                                  departmentController.text,
                                  facultyController.text,
                                  positionController.text,
                                );
                              },
                              text: 'Register',
                            );
                    }),
                    const SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/Login");
                              },
                              child: Text("Sign In"))
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
