import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:request/screens/HistoryRequest.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text('Vean Vong'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/Notification");
            },
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              // Toggle theme logic here
            },
            icon: Icon(Icons.dark_mode),
          ),
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
                  SizedBox(height: 10),
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
            Divider(
              color: Colors.grey,
              // thickness: 2,
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
                Navigator.pushNamed(context, "/");
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _buildHomepageContent(),
          HistoryRequest(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          child: FlashyTabBar(
            backgroundColor: Color.fromARGB(255, 200, 194, 194),
            selectedIndex: _selectedIndex,
            showElevation: true,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
                _pageController.jumpToPage(index);
              });
            },
            items: [
              FlashyTabBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                title: Text('Home', style: TextStyle(color: Colors.black)),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.history, color: Colors.black),
                title: Text('History', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomepageContent() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Sunday, 11 August 2024"),
              ],
            ),
          ),
          SizedBox(height: 10),
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(7, (index) {
                    final daysOfWeek = [
                      "Sun",
                      "Mon",
                      "Tue",
                      "Wed",
                      "Thu",
                      "Fri",
                      "Sat"
                    ];
                    final dayNumbers = [
                      "11",
                      "12",
                      "13",
                      "14",
                      "15",
                      "16",
                      "17"
                    ];
                    bool isSelected = index == 0;

                    return GestureDetector(
                      onTap: () {
                        // Handle date selection
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 11),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Color.fromARGB(255, 34, 11, 210)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.transparent),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(daysOfWeek[index],
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black)),
                            SizedBox(height: 5),
                            Text(dayNumbers[index],
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black)),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "Computer Labs",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildLabItem("Lab 010", "Samdech SorHeang"),
                _buildLabItem("Lab 011", "Samdech SorHeang"),
                _buildLabItem("Lab 017", "Samdech SorHeang"),
                _buildLabItem("Programming Lab", "STEMP"),
                _buildLabItem("Computer for Engineer Lab", "STEMP"),
                _buildLabItem("Network Lab", "STEMP"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "Sessions Time",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(6, (index) {
              final times = [
                "08:00 - 9:00 AM",
                "10:00 - 11:00 AM",
                "12:00 - 1:00 PM",
                "02:00 - 3:00 PM",
                "04:00 - 5:00 PM",
                "06:00 - 7:00 PM",
              ];
              bool isSelected = index == 0;

              return GestureDetector(
                onTap: () {
                  // Handle time selection
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color.fromARGB(255, 34, 11, 210)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Text(
                    times[index],
                    style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/Request");
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 34, 11, 210),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabItem(String labName, String location) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(labName, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(location),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap,
      required Color iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(text),
      onTap: onTap,
    );
  }

  Widget _buildDrawerHeader(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.grey,
          )),
    );
  }
}
