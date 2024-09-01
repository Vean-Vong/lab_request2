import 'package:flutter/material.dart';

class EditDetail extends StatefulWidget {
  EditDetail({super.key});

  @override
  _EditDetailState createState() => _EditDetailState();
}

class _EditDetailState extends State<EditDetail> {
  Map<String, String> sessionStatuses = {
    '07:00 - 08:30 AM': 'Available',
    '09:00 - 10:30 AM': 'Selected',
    '11:00 - 12:30 PM': 'Free',
    '01:00 - 02:30 PM': 'Unavailable',
  };

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
        title: Text("Edit Detail"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: buildTextField(label: 'Lab', hint: 'Lab 013'),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: buildTextField(
                    label: 'Date',
                    hint: 'Sunday, 11 August 2024',
                    suffixIcon: Icon(Icons.calendar_today, size: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: buildTextField(label: 'Major', hint: 'Accounting'),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: buildTextField(
                      label: 'Subject', hint: 'Computer Practice'),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: buildTextField(label: 'Generation', hint: '18'),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: buildTextField(label: 'Student Quantity', hint: '<50'),
                ),
              ],
            ),
            SizedBox(height: 8),
            buildTextField(label: 'Software Use', hint: 'Ms Excel'),
            SizedBox(height: 8),
            buildTextField(
              label: 'Additional',
              hint: 'I want to use Ms Excel 2016 and include one speaker.',
              maxLines: 3,
            ),
            SizedBox(height: 16),
            Text(
              'Sessions:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 150, // Adjust height as needed
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: sessionStatuses.keys.map((session) {
                  return buildSessionButton(session, sessionStatuses[session]!);
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildActionButton('Cancel', Colors.grey, Colors.white),
                buildActionButton('Update', Colors.blue, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required String hint,
    int maxLines = 1,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSessionButton(String time, String status) {
    Color bgColor;
    Color textColor;
    String statusText;

    switch (status) {
      case 'Selected':
        bgColor = Colors.blue;
        textColor = Colors.white;
        statusText = 'Selected';
        break;
      case 'Free':
        bgColor = Colors.green;
        textColor = Colors.white;
        statusText = 'Free';
        break;
      case 'Unavailable':
        bgColor = Colors.grey;
        textColor = Colors.white;
        statusText = 'Unavailable';
        break;
      default:
        bgColor = Colors.white;
        textColor = Colors.black;
        statusText = 'Available';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: bgColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value:
                status == 'Selected', // Adjust checkbox value based on status
            onChanged: (bool? value) {
              // Handle checkbox changes if needed
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
              ),
              Text(
                statusText,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildActionButton(String text, Color bgColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 14),
      ),
    );
  }
}
