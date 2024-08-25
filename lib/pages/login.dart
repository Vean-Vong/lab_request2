import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(""),
                Text("Login"),
                Text("SignIn to continue... ")
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Name",
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.password),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
