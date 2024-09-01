import 'package:flutter/material.dart';

class HistoryRequest extends StatefulWidget {
  @override
  _HistoryRequestState createState() => _HistoryRequestState();
}

class _HistoryRequestState extends State<HistoryRequest>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;
  final GlobalKey<ScaffoldState> scaffolded = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolded,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.sort),
      //     onPressed: () {
      //       scaffolded.currentState?.openDrawer();
      //     },
      //   ),
      //   title: Text('History Requested'),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.pushNamed(context, "/Notification");
      //         },
      //         icon: Icon(Icons.notifications)),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.person)),
      //   ],
      // ),
      drawer: Drawer(
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
            SizedBox(height: 10),
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
      ),
      body: Column(
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Request History",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/RequestDetails");
            },
            child: SlideTransition(
              position: _offsetAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lab 013"),
                      Text("Sunday, 10 August 2024 | 08:00 AM")
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/RequestDetails");
            },
            child: SlideTransition(
              position: _offsetAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lab 013"),
                      Text("Sunday, 10 August 2024 | 08:00 AM")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
