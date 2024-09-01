import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:get/get.dart';
import 'package:request/views/HistoryRequest.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../controllers/controller.dart';
import 'widgets/my_drawer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SelectionController controller = Get.find();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: Text('Vean Vong'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/Notification"),
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
      drawer: CustomDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _selectedIndex = index),
        children: [
          _buildHomepageContent(),
          HistoryRequest(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: FlashyTabBar(
          backgroundColor: Color(0xFFC8C2C2),
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          }),
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
    );
  }

  Widget _buildHomepageContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateSelector(),
          const SizedBox(height: 10),
          _buildLabSection(),
          const SizedBox(height: 10),
          _buildSessionSection(),
          const SizedBox(height: 10),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMM yyyy').format(now);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Today, $formattedDate',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: WeekView(),
          ),
        ),
      ],
    );
  }

  Widget _buildLabSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            "Computer Labs",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildLabItem("Lab 013", "Samdech SorHeang", 0),
            _buildLabItem("Programming Lab", "STEMP", 3),
            _buildLabItem("Computer for Engineer Lab", "STEMP", 4),
            _buildLabItem("Network Lab", "STEMP", 5),
          ],
        ),
      ],
    );
  }

  Widget _buildSessionSection() {
    final times = [
      "08:00 - 09:00 AM",
      "10:00 - 11:00 AM",
      "12:00 - 01:00 PM",
      "02:00 - 03:00 PM",
      "04:00 - 05:00 PM",
      "06:00 - 07:00 PM"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            "Sessions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: List.generate(times.length, (index) {
              bool isSelected = controller.selectedTimeIndices.contains(index);
              return GestureDetector(
                onTap: () => setState(() {
                  isSelected
                      ? controller.selectedTimeIndices.remove(index)
                      : controller.selectedTimeIndices.add(index);
                }),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity, // Make the card full-width
                  decoration: BoxDecoration(
                    color:
                        isSelected ? Colors.blue.shade100 : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: isSelected ? Colors.blue : Colors.white,
                        width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      times[index],
                      style: TextStyle(
                        color: isSelected ? Colors.blue : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildLabItem(String labName, String location, int index) {
    bool isSelected = index == controller.selectedLabIndex.value;
    return GestureDetector(
      onTap: () => setState(() => controller.selectLab(index)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(labName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.blue : Colors.white)),
            Text(location,
                style:
                    TextStyle(color: isSelected ? Colors.blue : Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/Request"),
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
            Text("Next", style: TextStyle(color: Colors.white)),
            Icon(Icons.arrow_forward_ios, size: 15),
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
