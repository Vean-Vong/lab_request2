import 'package:flutter/material.dart';

class Language extends StatelessWidget {
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
        title: Text("Languages"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                // push to change language
              },
              child: _buildLanguageOption(
                context,
                imagePath: "assets/images/cambodia.png",
                languageName: "Khmer",
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // push to change language
              },
              child: _buildLanguageOption(
                context,
                imagePath: "assets/images/united.png",
                languageName: "English",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, {required String imagePath, required String languageName}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 40),
          SizedBox(width: 20),
          Text(languageName),
        ],
      ),
    );
  }
}
