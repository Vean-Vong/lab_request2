import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
              Navigator.pushNamed(context, "/EditProfile");
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  )),
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
                      Text("Edit Profile"),
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
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  "General Settings",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/Language");
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  )),
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
                      Text("Language"),
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  )),
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
                      Text("About"),
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
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  )),
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
                      Text("Log Out"),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios, size: 18))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
