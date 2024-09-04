import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("notification".tr),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            NotificationCard(
              title: "Lab Request",
              date: "Sunday, 19 May 2024",
              description:
                  "Your lab request is pending. Admin will review your request.",
            ),
            SizedBox(height: 10),
            NotificationCard(
              title: "Approve",
              date: "Sunday, 19 May 2024",
              description:
                  "Your lab request is pending. Admin will review your request.",
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  NotificationCard({
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(date),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
