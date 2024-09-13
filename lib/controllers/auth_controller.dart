import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/auth_model.dart';
import '../views/components/navigattion.dart';

class AuthController extends GetxController {
  var user = UserModel(
          id: 0,
          name: '',
          email: '',
          gender: '',
          phone: '',
          department: '',
          faculty: '',
          position: '',
          token: '')
      .obs;
  var isLoading = false.obs;

  Future<void> register(
      String name,
      String email,
      String password,
      String phone,
      String gender,
      String department,
      String faculty,
      String position) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('[api_ip:port]/api/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'gender': gender,
          'department': department,
          'faculty': faculty,
          'position': position,
        }),
      );

      // Print response for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);

        // Check if the response has both user and token fields
        if (data.containsKey('user') && data.containsKey('token')) {
          user.value = UserModel.fromJson(data['user']);
          user.value.token = data['token'];

          Get.snackbar('Success', 'User registered successfully',
              duration: Duration(seconds: 3));
          Get.offAllNamed('/Login');
        } else {
          Get.snackbar('Error', 'Unexpected response format');
          print(
              'Unexpected response format: $data'); // Print the unexpected format
        }
      } else {
        var errorMessage = 'Registration failed';
        if (response.body.isNotEmpty) {
          var errorData = jsonDecode(response.body);
          if (errorData.containsKey('message')) {
            errorMessage = errorData['message'];
          }
          // Print the error message
          print('Error data: $errorData');
        }
        Get.snackbar('Error', errorMessage);
      }
    } catch (e) {
      // Print any error that occurs
      print('Error: $e');
      Get.snackbar('Error', 'Something went wrong. Please try again later.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('[api_ip:port]/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      // Print response for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // Check if the response has both user and token fields
        if (data.containsKey('user') && data.containsKey('token')) {
          user.value = UserModel.fromJson(data['user']);
          user.value.token = data['token'];

          Get.snackbar('Success', 'Login successful',
              duration: Duration(seconds: 3));
          Get.offAll(() => Navigation());
        } else {
          Get.snackbar('Error', 'Unexpected response format');
          print('Unexpected response format: $data');
        }
      } else {
        var errorMessage = 'Login failed';
        if (response.body.isNotEmpty) {
          var errorData = jsonDecode(response.body);
          if (errorData.containsKey('message')) {
            errorMessage = errorData['message'];
          }
          // Print the error message
          print('Error data: $errorData');
        }
        Get.snackbar('Error', errorMessage);
      }
    } catch (e) {
      // Print any error that occurs
      print('Error: $e');
      Get.snackbar('Error', 'Something went wrong. Please try again later.');
    } finally {
      isLoading.value = false;
    }
  }
}
