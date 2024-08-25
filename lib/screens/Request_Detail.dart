import 'package:flutter/material.dart';
import 'package:request/screens/DeletionConfirmationScreen.dart';

class RequestDetails extends StatefulWidget {
  const RequestDetails({super.key});

  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  bool isDeleted = false;

  void _handleDelete() {
    // Implement deletion logic here (e.g., make an API call to delete the request)
    setState(() {
      isDeleted = true;
    });
    // Navigate to the deletion confirmation screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const DeletionConfirmationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Request's Detail"),
      ),
      body: Container(
        margin:
            const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 200),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDetailRow('Request Lab:', '013'),
            buildDetailRow('Request Date:', 'Sunday, 11 August 2024'),
            buildDetailRow('Phone:', '096712123'),
            buildDetailRow('Major:', 'Accounting'),
            buildDetailRow('Subject:', 'Computer Practice'),
            buildDetailRow('Generation:', '18'),
            buildDetailRow('Software Use:', 'Ms Excel'),
            buildDetailRow('Student Quantity:', '<50'),
            const SizedBox(height: 10),
            const Text(
              'Sessions:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                buildSessionButton('07:00 - 08:30 AM'),
                const SizedBox(width: 10),
                buildSessionButton('07:00 - 08:30 AM'),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Additional:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'I want to use Ms Excel 2016 and include one speaker.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildActionButton(
                  Icons.delete,
                  'Remove',
                  Colors.red,
                  _handleDelete,
                ),
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
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSessionButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.green),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.green),
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
        Text(
          label,
          style: TextStyle(color: color, fontSize: 14),
        ),
      ],
    );
  }
}
