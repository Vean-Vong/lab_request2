import 'package:flutter/material.dart';

class EditDetail extends StatefulWidget {
  const EditDetail({super.key});

  @override
  _EditDetailState createState() => _EditDetailState();
}

class _EditDetailState extends State<EditDetail> {
  Map<String, bool> sessionSelections = {
    '07:00 - 08:30 AM': false,
    '07:00 - 08:30 AM': false,
    '07:00 - 08:30 AM': false,
    '07:00 - 08:30 AM': false,
    '07:00 - 08:30 AM': false,
    '07:00 - 08:30 AM': false,
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
      body: Padding(
        padding: EdgeInsets.all(8.0), // Reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: buildTextField(label: 'Lab', hint: 'Lab 013'),
                ),
                SizedBox(width: 8), // Reduced spacing
                Expanded(
                  child: buildTextField(
                    label: 'Date',
                    hint: 'Sunday, 11 August 2024',
                    suffixIcon: Icon(Icons.calendar_today,
                        size: 18), // Reduced icon size
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: buildTextField(label: 'Major', hint: 'Accounting'),
                ),
                SizedBox(width: 8), // Reduced spacing
                Expanded(
                  child: buildTextField(
                      label: 'Subject', hint: 'Computer Practice'),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: buildTextField(label: 'Generation', hint: '18'),
                ),
                SizedBox(width: 8), // Reduced spacing
                Expanded(
                  child: buildTextField(label: 'Student Quantity', hint: '<50'),
                ),
              ],
            ),
            buildTextField(label: 'Software Use', hint: 'Ms Excel'),
            buildTextField(
              label: 'Additional',
              hint: 'I want to use Ms Excel 2016 and include one speaker.',
              maxLines: 3,
            ),
            SizedBox(height: 16), // Reduced spacing
            Text(
              'Sessions:',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold), // Reduced font size
            ),
            SizedBox(height: 8), // Reduced spacing
            Wrap(
              spacing: 8, // Reduced spacing
              runSpacing: 8, // Reduced spacing
              children: [
                buildSessionButton(
                    '07:00 - 08:30 AM', 'Selected', Colors.black, Colors.white),
                buildSessionButton(
                    '07:00 - 08:30 AM', 'Select', Colors.black, Colors.white),
                buildSessionButton(
                    '07:00 - 08:30 AM', 'Free', Colors.green, Colors.white),
                buildSessionButton(
                    '07:00 - 08:30 AM', 'Rong Thida', Colors.red, Colors.white),
                buildSessionButton(
                    '07:00 - 08:30 AM', 'Rong Thida', Colors.red, Colors.white),
                buildSessionButton(
                    '07:00 - 08:30 AM', 'Rong Thida', Colors.red, Colors.white),
              ],
            ),
            SizedBox(height: 16), // Reduced spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildActionButton('Cancel', Colors.grey, Colors.white),
                buildActionButton('Save', Colors.blue, Colors.white),
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
      padding: EdgeInsets.symmetric(vertical: 4.0), // Reduced padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold), // Reduced font size
          ),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 8, vertical: 5), // Reduced padding
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSessionButton(
      String time, String label, Color bgColor, Color textColor) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: EdgeInsets.only(left: 20, top: 5),
          padding: EdgeInsets.all(5), // Reduced padding
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10), // Reduced border radius
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: sessionSelections[time],
                onChanged: (bool? value) {
                  setState(() {
                    sessionSelections[time] = value ?? false;
                  });
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                        color: textColor, fontSize: 12), // Reduced font size
                  ),
                  Text(
                    label,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12), // Reduced font size
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildActionButton(String text, Color bgColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: EdgeInsets.symmetric(
            horizontal: 30, vertical: 10), // Reduced padding
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 14), // Reduced font size
      ),
    );
  }
}
