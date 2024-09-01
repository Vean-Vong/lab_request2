import 'package:flutter/material.dart';

class About extends StatelessWidget {
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
        title: Text("About"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/nubb.png",
                      width: 80,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lab Request",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Lab Request Management App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "An essential tool for administrators to efficiently manage and oversee lab resource requests within our institution. This app is designed to streamline the process of handling and approving requests from teachers, ensuring that lab resources are utilized effectively and according to plan.",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10),
              Text(
                "Key Features",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "• Simple Lab Reservations: Quickly browse available labs and select the one that meets your needs.\n"
                  "• Real-Time Availability: Check the available of resources in real time and select from a range of time slots.\n"
                  "• Efficient Session Management: Easily manage your booking requests and receive confirmation notifications.\n"
                  "• User-Friendly Interface: Designed with teachers in mind, our app features a clean and intuitive interface for a smooth experience.",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Our goal is to support educators by providing a tool that simplifies lab management, allowing you to focus on delivering quality education to your students.",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10),
              Text(
                "If you have any questions or need assistance, please don’t hesitate to contact our support team.",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10),
              Text(
                "🙏  Thank you for using the Computer Lab Request App!",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
