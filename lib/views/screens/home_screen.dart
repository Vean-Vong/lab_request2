import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/data_selection_controller.dart';
import 'notifiction_screen.dart';
import 'request_screen.dart';
import '../components/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DateSelectionController controller = Get.put(DateSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('home_page'.tr),
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
      // Drawer
      drawer: const CustomDrawer(),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: DateSelection(),
              ),
              const SizedBox(height: 10),
              LabSelection(),
              const SizedBox(height: 10),
              SessionSelection(),
              const SizedBox(height: 10),
              RequestButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// Request Button
class RequestButton extends StatelessWidget {
  const RequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    final DateSelectionController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'request_detail'.tr,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            if (controller.areSelectionsComplete()) {
              // Navigate to the next page
              Get.to(() => Request());
            } else {
              // Show warning
              Get.snackbar(
                'Incomplete Selection',
                'Please select a date, a lab, and at least one session.',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red[700],
                colorText: Colors.white,
              );
            }
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'request'.tr,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

// Session Selection
class SessionSelection extends StatelessWidget {
  const SessionSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final DateSelectionController controller = Get.find();

    final sessions = [
      {'time': '07:00-08:30 AM', 'order': '1'},
      {'time': '08:50-10:20 AM', 'order': '2'},
      {'time': '10:50-12:00 AM', 'order': '3'},
      {'time': '01:00-02:30 PM', 'order': '4'},
      {'time': '02:50-04:20 PM', 'order': '5'},
      {'time': '04:30-05:30 PM', 'order': '6'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'sessions'.tr,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ...sessions.map((session) {
          return Obx(() {
            bool isSelected =
                controller.selectedSessions.contains(session['time']);
            return GestureDetector(
              onTap: () {
                controller.toggleSessionSelection(session['time']!);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.shade100 : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.blue.shade300,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timelapse, color: Colors.blue, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          session['time']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          session['order']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }).toList(),
      ],
    );
  }
}

// Lab Selection
class LabSelection extends StatelessWidget {
  const LabSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final DateSelectionController controller = Get.find();

    final labs = [
      {'name': 'Lab 1', 'building': 'Building 1'},
      {'name': 'Lab 2', 'building': 'Building 2'},
      {'name': 'Lab 3', 'building': 'Building 3'},
      {'name': 'Lab 4', 'building': 'Building 4'},
      {'name': 'Lab 5', 'building': 'Building 5'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'computer_room'.tr,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ...labs.map((lab) {
          return Obx(() {
            bool isSelected = controller.selectedLab.value == lab['name'];
            return GestureDetector(
              onTap: () {
                if (lab['name'] != null) {
                  controller.updateSelectedLab(lab['name']!);
                } else {
                  print("Lab name is null");
                }
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.shade100 : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.blue.shade300,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.computer, color: Colors.blue, size: 24),
                        const SizedBox(width: 8),
                        Text(
                          lab['name']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      lab['building']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: isSelected ? Colors.blue : Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }).toList(),
      ],
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
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMM yyyy');
    final formattedDate = formatter.format(now);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'date'.tr,
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
            controller: Get.find<DateSelectionController>(),
          ),
        ),
      ],
    );
  }
}

class WeekView extends StatelessWidget {
  final DateSelectionController controller;

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
