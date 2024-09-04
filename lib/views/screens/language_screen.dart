import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: Text('language'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                var locale = Locale('km', 'KH');
                Get.updateLocale(locale);
                Get.changeTheme(ThemeData(
                    textTheme: ThemeData.light()
                        .textTheme
                        .apply(fontFamily: 'NotoSansKhmer')));
              },
              child: _buildLanguageOption(
                context,
                imagePath: "assets/images/cambodia.png",
                languageName: "ភាសាខ្មែរ",
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                var locale = Locale('en', 'US');
                Get.updateLocale(locale);
                Get.changeTheme(ThemeData(
                    textTheme: ThemeData.light()
                        .textTheme
                        .apply(fontFamily: 'Roboto')));
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

  Widget _buildLanguageOption(BuildContext context,
      {required String imagePath, required String languageName}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
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
