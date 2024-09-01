import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request/views/DeletionConfirmationScreen.dart';

import '../controllers/controller.dart';

class RequestDetails extends StatefulWidget {
  RequestDetails({super.key});

  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  void _handleDelete() {
    // Implement deletion logic here (e.g., make an API call to delete the request)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DeletionConfirmationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<SelectionController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Request's Detail"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.only(bottom: 200), // Adjust margin as needed
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetailRow(Icons.business, 'Request Lab :',
                  '${controller.selectedLabIndex.value}'),
              buildDetailRow(Icons.calendar_today, 'Request Date:',
                  'Sunday, 11 August 2024'),
              buildDetailRow(Icons.phone, 'Phone :', '096712123'),
              buildDetailRow(Icons.book, 'Major :', 'Accounting'),
              buildDetailRow(Icons.subject, 'Subject :', 'Computer Practice'),
              buildDetailRow(Icons.people, 'Generation :', '18'),
              buildDetailRow(Icons.computer, 'Software Use :', 'Ms Excel'),
              buildDetailRow(Icons.group, 'Student Quantity :', '<50'),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.lock_clock,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Sessions:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8, // Spacing between session buttons
                runSpacing: 8, // Spacing between rows
                children: [
                  buildSessionButton(Icons.check_circle, '08:30 - 10:00 AM',
                      'Available', Colors.green, Colors.white),
                  buildSessionButton(Icons.cancel, '10:00 - 11:30 AM',
                      'Unavailable', Colors.red, Colors.white),
                  buildSessionButton(Icons.check_circle, '11:30 - 01:00 PM',
                      'Available', Colors.green, Colors.white),
                ],
              ),
              SizedBox(height: 10),
              buildDetailRow(Icons.info_outline, 'Additional:', ''),
              SizedBox(height: 5),
              Text(
                'I want to use Ms Excel 2016 and include one speaker.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildActionButton(
                    Icons.delete,
                    'Remove',
                    Colors.red,
                    _handleDelete,
                  ),
                  SizedBox(width: 16), // Add spacing
                  buildActionButton(
                    Icons.edit,
                    'Edit',
                    Colors.grey,
                    () {
                      Navigator.pushNamed(context, "/EditDetail");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(IconData icon, String label, [String value = '']) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(icon, size: 20, color: Colors.grey),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSessionButton(IconData icon, String time, String status,
      Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: textColor,
            size: 16,
          ),
          SizedBox(width: 5),
          Text(
            '$time - $status',
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }

  Widget buildActionButton(
      IconData icon, String label, Color color, VoidCallback onPressed) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(40),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: color),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: color, fontSize: 14),
        ),
      ],
    );
  }
}
