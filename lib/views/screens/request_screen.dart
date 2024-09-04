import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/data_selection_controller.dart';
import '../components/navigattion.dart'; // Ensure correct import

class Request extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateSelectionController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Request"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Date(controller: controller),
              SizedBox(height: 10),
              _LabSection(controller: controller),
              SizedBox(height: 10),
              _SessionsSection(controller: controller),
              SizedBox(height: 10),
              _AdditionalDetailsSection(),
              SizedBox(height: 20),
              _SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Date extends StatelessWidget {
  final DateSelectionController controller;

  _Date({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          color: Colors.blue,
          size: 15,
        ),
        SizedBox(width: 10),
        Text("Date:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        Expanded(
          child: Obx(() {
            final selectedDate = controller.selectedDate.value;

            final formattedDate =
                DateFormat('EEEE, dd MMM yyyy').format(selectedDate);

            return Text(
              "$formattedDate",
              overflow: TextOverflow.ellipsis,
            );
          }),
        ),
      ],
    );
  }
}

class _LabSection extends StatelessWidget {
  final DateSelectionController controller;

  _LabSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.computer,
          color: Colors.blue,
          size: 15,
        ),
        SizedBox(width: 10),
        Text("Lab:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        Expanded(
          child: Obx(() {
            final selectedLab = controller.selectedLab.value;
            return Text(
              selectedLab.isNotEmpty ? selectedLab : "Not selected",
              overflow: TextOverflow.ellipsis,
            );
          }),
        ),
      ],
    );
  }
}

class _SessionsSection extends StatelessWidget {
  final DateSelectionController controller;

  _SessionsSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.lock_clock,
              color: Colors.blue,
              size: 15,
            ),
            SizedBox(width: 10),
            Text("Sessions:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 10),
        Obx(() {
          final selectedSessions = controller.selectedSessions;
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: selectedSessions.map((session) {
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
          );
        }),
      ],
    );
  }
}

class _AdditionalDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateSelectionController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Complete Details",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Software Need",
              labelText: 'Software Need'),
          onChanged: (value) {
            controller.softwareNeed.value = value;
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Generation",
              labelText: 'Generation'),
          onChanged: (value) {
            controller.generation.value = value;
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Major",
              labelText: 'Major'),
          onChanged: (value) {
            controller.major.value = value;
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Subject",
              labelText: 'Subject'),
          onChanged: (value) {
            controller.subject.value = value;
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Student",
              labelText: 'Student'),
          onChanged: (value) {
            controller.studentQuantity.value = value;
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Additional (Optional)",
              labelText: 'Additional'),
          onChanged: (value) {
            controller.additionalNotes.value = value;
          },
        ),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final DateSelectionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          if (controller.areInputComplete()) {
            Get.snackbar(
              'Success',
              'Request submitted successfully',
              colorText: Colors.white,
              backgroundColor: Colors.green,
              snackPosition: SnackPosition.TOP,
            );

            controller.addRequest();

            // Add a 1-second delay before navigating
            Future.delayed(Duration(seconds: 1), () {
              Get.to(() => Navigation());
              controller.clearSelections();
            });

            controller.printAllData();
          } else {
            Get.snackbar(
              'Incomplete Input',
              'Please complete all input fields before submitting',
              colorText: Colors.white,
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.TOP,
            );
          }
        },
        child: Text(
          "Submit",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
