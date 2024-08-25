import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/nubb.png",
                    width: 130,
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
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.clear),
                      hintText: "Name",
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.key_sharp),
                      suffixIcon: Icon(Icons.visibility),
                      hintText: "Password",
                    ),
                  ),
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
                Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/Homepage");
                      },
                      child: Text(
                        "Sing In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/Register");
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
    );
  }
}
