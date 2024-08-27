import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../components/my_drawer.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffolkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, dd MMM yyyy');
    final formattedDate = formatter.format(now);

    String? _selectedLab;

    final List<String> timeSlots = [
      "07:00 - 08:30 AM",
      "10:00 AM",
      "12:00 PM",
      "02:00 PM",
      "04:00 PM",
      "06:00 PM"
    ];

    return Scaffold(
      key: scaffolkey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {
            scaffolkey.currentState?.openDrawer();
          },
        ),
        title: Text('Home Page'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.to('/Notification');
              },
              icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
        ],
      ),
      // Drawer
      drawer: MyDrawer(),
      // Body
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Select Date & Current Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            // Card of upcoming 7 days
            const SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: WeekView(),
            ),
            SizedBox(height: 10),

            // Computer Room Section
            Text(
              "Select Lab",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),

            // Lab Selection
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButtonFormField<String>(
                      value: _selectedLab,
                      hint: const Text(
                        'Select a lab',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLab = newValue;
                        });
                      },
                      items: <String>[
                        '010',
                        '011',
                        '013',
                        'Programming Lab',
                        'Networking Lab',
                        'Computer of Engineering Lab'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Sessions Section
            Text(
              "Sessions",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Time Slots
            Expanded(
              // Expanded widget allows GridView to take up the remaining space
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  return TimeSlot(timeSlot: timeSlots[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Time Slot Card
class TimeSlot extends StatelessWidget {
  final String timeSlot;

  const TimeSlot({
    super.key,
    required this.timeSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1)),
      child: Center(
        child: Text(
          timeSlot,
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
