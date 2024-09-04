import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/edit_profile.dart';
import '../screens/language_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(90, 158, 158, 158),
            ),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/image.png",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Vean Vong",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text("098765477"),
              ],
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Get.to(() => EditProfile());
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.green,
                          )),
                      Text("edit_profile".tr),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios, size: 18))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Divider(),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "general".tr,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => Language());
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.language,
                            color: Colors.amber,
                          )),
                      Text("language".tr),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios, size: 18))
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/About");
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.help,
                            color: Colors.blue,
                          )),
                      Text("about".tr),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios, size: 18))
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/Login");
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red.withOpacity(0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.login_outlined,
                            color: Colors.red,
                          )),
                      Text("log_out".tr),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
