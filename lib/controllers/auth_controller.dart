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
          position: '',
          token: '')
      .obs;
  var isLoading = false.obs;

  Future<void> register(String name, String email, String password,
      String phone, String gender, String department, String position) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('http://192.168.2.2:8000/api/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'gender': gender,
          'department': department,
          'position': position,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);

        if (data.containsKey('access_token')) {
          // Update the user model with the token
          user.value.token = data['access_token'];

          Get.snackbar('Success', 'User registered successfully',
              duration: Duration(seconds: 3));
          Get.offAllNamed('/Login');
        } else {
          Get.snackbar('Error', 'Access token not found in response');
          print('Unexpected response format: $data');
        }
      } else {
        var errorMessage = 'Registration failed';
        if (response.body.isNotEmpty) {
          var errorData = jsonDecode(response.body);
          if (errorData.containsKey('message')) {
            errorMessage = errorData['message'];
          }
          print('Error data: $errorData');
        }
        Get.snackbar('Error', errorMessage);
      }
    } catch (e) {
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
        Uri.parse('http://192.168.2.2:8000/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data.containsKey('access_token')) {
          user.value.token = data['access_token'];

          // You might want to fetch user details here if needed
          // await fetchUserDetails();

          Get.snackbar('Success', 'Login successful',
              duration: Duration(seconds: 3));
          Get.offAll(() => Navigation());
        } else {
          Get.snackbar('Error', 'Access token not found in response');
          print('Unexpected response format: $data');
        }
      } else {
        var errorMessage = 'Login failed';
        if (response.body.isNotEmpty) {
          var errorData = jsonDecode(response.body);
          if (errorData.containsKey('message')) {
            errorMessage = errorData['message'];
          }
          print('Error data: $errorData');
        }
        Get.snackbar('Error', errorMessage);
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'Something went wrong. Please try again later.');
    } finally {
      isLoading.value = false;
    }
  }

  // You might need to add this method to fetch user details after login
  Future<void> fetchUserDetails() async {
    // Implement API call to get user details using the access token
    // Update the user model with the fetched details
  }
}
