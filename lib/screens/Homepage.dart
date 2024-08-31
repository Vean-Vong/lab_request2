import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:request/screens/HistoryRequest.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../widgets/my_drawer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int? selectedLabIndex;
  int _selectedIndex = 0;
  bool isExpanded = true;
  List<int> selectedTimeIndices = [];
  bool isSessionExpanded = true;

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
          // Notification
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/Notification");
            },
            icon: Icon(Icons.notifications),
          ),
          // Dark Mode
          IconButton(
            onPressed: () {
              // Toggle theme logic here
            },
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),
      // Drawer
      drawer: CustomDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // Body
        children: [
          _buildHomepageContent(),
          HistoryRequest(),
        ],
      ),
      // Bottom Navigation
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
    // Format Date Declaration
    final now = DateTime.now();
    final formatter = DateFormat('dd MMM yyyy');
    final formatteDate = formatter.format(now);

    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Date
              const Text(
                'Date',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Actual Date
              Text(
                'Today, $formatteDate',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: WeekView(),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: const Text(
                  "Computer Labs",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          if (isExpanded)
            Expanded(
              child: ListView(
                children: [
                  _buildLabItem("Lab 010", "Samdech SorHeang", 0),
                  _buildLabItem("Lab 011", "Samdech SorHeang", 1),
                  _buildLabItem("Lab 017", "Samdech SorHeang", 2),
                  _buildLabItem("Programming Lab", "STEMP", 3),
                  _buildLabItem("Computer for Engineer Lab", "STEMP", 4),
                  _buildLabItem("Network Lab", "STEMP", 5),
                ],
              ),
            ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: const Text(
                  "Sessions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: Icon(isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
                onPressed: () {
                  setState(() {
                    isSessionExpanded = !isSessionExpanded;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          if (isSessionExpanded)
            GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3,
              ),
              itemBuilder: (context, index) {
                final times = [
                  "08:00 - 09:00 AM",
                  "10:00 - 11:00 AM",
                  "12:00 - 01:00 PM",
                  "02:00 - 03:00 PM",
                  "04:00 - 05:00 PM",
                  "06:00 - 07:00 PM",
                ];
                bool isSelected = selectedTimeIndices.contains(index);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle selection for multiple slots
                      if (isSelected) {
                        selectedTimeIndices.remove(index);
                      } else {
                        selectedTimeIndices.add(index);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.transparent),
                    ),
                    child: Center(
                      // Center text inside each card
                      child: Text(
                        times[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          SizedBox(height: 10),
          // Request Page
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/Request");
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
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

  Widget _buildLabItem(String labName, String location, int index) {
    bool isSelected = index == selectedLabIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLabIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.white,
              ),
            ),
            Text(
              location,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeekView extends StatefulWidget {
  const WeekView({super.key});

  @override
  _WeekViewState createState() => _WeekViewState();
}

class _WeekViewState extends State<WeekView> {
  DateTime selectedDate = DateTime.now();

  List<Map<String, dynamic>> getDaysOfWeek() {
    DateTime now = DateTime.now();
    return List.generate(14, (index) {
      DateTime date = now.add(Duration(days: index));
      return {
        "day": DateFormat('EEE').format(date),
        "date": date.day.toString(),
        "isSelected": date.day == selectedDate.day,
        "isToday": date.day == now.day &&
            date.month == now.month &&
            date.year == now.year,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> days = getDaysOfWeek();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: days.map((day) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = DateTime.now().add(
                Duration(days: days.indexOf(day)),
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 60,
              height: 90,
              decoration: BoxDecoration(
                color: day['isSelected']
                    ? Colors.blue.shade200
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
                border: day['isToday']
                    ? Border.all(color: Colors.blue, width: 3)
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day['day'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    day['date'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
