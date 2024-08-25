import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffolkey = GlobalKey<ScaffoldState>();

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolkey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.sort), // Replace with any icon you prefer
          onPressed: () {
            _scaffolkey.currentState?.openDrawer();
          },
        ),
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Notification");
              },
              icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
        ],
      ),
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
              onTap: () {},
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
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date"),
                  Text("Today, 11 August 2024"),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Horizontal Scrollable Container Rows with Fade-Right Animation
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: List.generate(7, (index) {
                        // Create a list of Container widgets for each day of the week
                        final daysOfWeek = [
                          "Sun",
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                          "Sat"
                        ];
                        bool isWhiteBackground = index % 2 ==
                            1; // Change background color conditionally

                        return Container(
                          height: 92,
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: isWhiteBackground
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                daysOfWeek[index],
                                style: TextStyle(
                                    color: isWhiteBackground
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "11",
                                style: TextStyle(
                                    color: isWhiteBackground
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Computer Room Section
            Text("Computer Room",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildLabContainer("Lab 014"),
                  SizedBox(height: 20),
                  _buildLabContainer("Lab 013"),
                  SizedBox(height: 20),
                  _buildLabContainer("Lab 013"),
                ],
              ),
            ),
            SizedBox(
                height:
                    10), // Increased bottom padding for Computer Room section

            // Sessions Section
            Text("Sessions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              children: [
                _buildSessionStatus(Colors.red, "Busy"),
                SizedBox(width: 20),
                _buildSessionStatus(Colors.green, "Free"),
              ],
            ),
            SizedBox(height: 10),

            // Time Slots
            _buildTimeSlots(Colors.green, true),
            SizedBox(height: 10),
            _buildTimeSlots(Colors.red, false),
            SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/Request");
              },
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Request"), Icon(Icons.arrow_forward_ios)],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Helper widget for Computer Room
  Widget _buildLabContainer(String labName) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(labName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildLabDetail(
                Icons.computer,
                "Computer : 30",
              ),
              _buildLabDetail(Icons.camera, "Camera : 01"),
              _buildLabDetail(Icons.volume_up_rounded, "Volume : 0"),
            ],
          ),
          Image.asset(
            "assets/images/lab.png",
            width: 150,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  // Helper widget for Lab Details
  Widget _buildLabDetail(IconData icon, String detail) {
    return Container(
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(detail),
        ],
      ),
    );
  }

  // Helper widget for Time Slots
  Widget _buildTimeSlots(Color borderColor, bool isFree) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(3, (index) {
          final timeSlot = [
            "07:00 - 08:00 AM",
            "09:00 - 10:00 AM",
            "08:00 - 09:00 AM"
          ][index];
          final status = isFree ? "Free" : "Eng Titya";
          final statusColor = isFree ? Colors.green : Colors.red;
          final icon = isFree ? Icons.check_box : Icons.close;
          return Container(
            width: 170,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Icon(icon, color: statusColor),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(timeSlot),
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      child: Text(status, style: TextStyle(color: statusColor)),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // Helper widget for Session Status
  Widget _buildSessionStatus(Color color, String status) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(Icons.check_box_outline_blank, color: color),
          SizedBox(width: 5),
          Text(status, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
