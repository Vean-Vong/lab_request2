import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/home_controller.dart';
import '../components/my_drawer.dart';
import 'notifiction_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: false,
          leading: IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          backgroundColor: Colors.grey[100],
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => Notifications());
              },
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
        backgroundColor: Colors.grey[100],

        // Drawer
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SingleChildScrollView(
                child: DateSelection(),
              ),
              const SizedBox(height: 10),

              // Lab Selection
              LabSelectionScreen(),
              const SizedBox(height: 10),

              // Session Cards
              Expanded(
                child: Obx(() {
                  var sessions = controller.sessions;
                  if (sessions.isEmpty) {
                    return Center(child: Text("No sessions available"));
                  }
                  return ListView.builder(
                    itemCount: sessions.length,
                    itemBuilder: (context, index) {
                      var session = sessions[index];
                      return Card(
                        elevation: 0,
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                session.timeSlot,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                session.sessionStatus == 'isAvailable'
                                    ? 'Available'
                                    : 'Busy',
                                style: TextStyle(
                                    color:
                                        session.sessionStatus == 'isAvailable'
                                            ? Colors.green
                                            : Colors.red),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              )
            ],
          ),
        ));
  }
}

// Lab Selection

class LabSelectionScreen extends StatefulWidget {
  @override
  _LabSelectionScreenState createState() => _LabSelectionScreenState();
}

class _LabSelectionScreenState extends State<LabSelectionScreen> {
  Map<String, String>? selectedLab;

  final List<Map<String, String>> labs = [
    {'name': 'Lab 01', 'building': 'Building 1'},
    {'name': 'Lab 02', 'building': 'Building 2'},
    {'name': 'Lab 03', 'building': 'Building 3'},
    {'name': 'Lab 04', 'building': 'Building 4'},
    {'name': 'Lab 05', 'building': 'Building 5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: DropdownButtonFormField<Map<String, String>>(
        decoration: InputDecoration(
          labelText: 'Select a Lab',
          labelStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
        value: selectedLab,
        items: labs.map((lab) {
          return DropdownMenuItem<Map<String, String>>(
            value: lab,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${lab['name']}   ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${lab['building']}'),
              ],
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedLab = value;
            // Notify the controller about the lab selection
            Get.find<HomeController>().updateSelectedLab(value?['name']);
          });
        },
        icon: Icon(Icons.arrow_drop_down),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

// Date Selection
class DateSelection extends StatefulWidget {
  const DateSelection({super.key});

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, dd MMM yyyy');
    final formattedDate = formatter.format(now);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date', // Adjust translation key if needed
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$formattedDate',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: WeekView(
            controller: controller,
          ),
        ),
      ],
    );
  }
}

class WeekView extends StatelessWidget {
  final HomeController controller;

  const WeekView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> getDaysOfWeek() {
      DateTime now = DateTime.now();

      return List.generate(14, (index) {
        DateTime date = now.add(Duration(days: index));
        return {
          "day": DateFormat('EEE').format(date),
          "date": date.day.toString(),
          "isSelected": date.day == controller.selectedDate.value.day &&
              date.month == controller.selectedDate.value.month &&
              date.year == controller.selectedDate.value.year,
          "isToday": date.day == now.day &&
              date.month == now.month &&
              date.year == now.year,
          "fullDate": date
        };
      });
    }

    List<Map<String, dynamic>> days = getDaysOfWeek();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: days.map((day) {
        return GestureDetector(
          onTap: () {
            controller.updateSelectedDate(day['fullDate']);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Obx(() {
              bool isSelected = day['fullDate'].day ==
                      controller.selectedDate.value.day &&
                  day['fullDate'].month ==
                      controller.selectedDate.value.month &&
                  day['fullDate'].year == controller.selectedDate.value.year;

              return Container(
                width: 60,
                height: 90,
                decoration: BoxDecoration(
                  color: day['isToday']
                      ? Colors.blue.shade200
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                  border: isSelected
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
              );
            }),
          ),
        );
      }).toList(),
    );
  }
}
