import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/data_selection_controller.dart';

class RequestDetail extends StatelessWidget {
  final int index;

  RequestDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final DateSelectionController controller =
        Get.find<DateSelectionController>();
    final request = controller.requests[index];

    // Split the sessions string into a list
    final List<String> sessionList = request['sessions'].split(', ');

    return Scaffold(
      appBar: AppBar(
        title: Text('Request Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.computer),
              title: Text(
                'Request Lab: ${request['labName']}',
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Request Date: ${request['date']}'),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Major: ${request['major']}'),
            ),
            ListTile(
              leading: Icon(Icons.class_),
              title: Text('Subject: ${request['subject']}'),
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Generation: ${request['generation']}'),
            ),
            ListTile(
              leading: Icon(Icons.laptop),
              title: Text('Software Requirements: ${request['softwareNeed']}'),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Student Quantity: ${request['studentQuantity']}'),
            ),
            const Divider(),
            Text(
              'Sessions:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: sessionList.map((session) {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  child: Text(session, style: TextStyle(fontSize: 14)),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Divider(),
            ListTile(
              leading: Icon(Icons.note),
              title: Text(
                'Additional:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                request['additionalNotes'] ?? 'No additional notes provided.',
              ),
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Handle remove action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
