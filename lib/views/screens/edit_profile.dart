import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameController = TextEditingController(text: "Vean Vong");
  final _genderController = TextEditingController(text: "Male");
  final _phoneController = TextEditingController(text: "098765445");
  final _passwordController = TextEditingController(text: "password123");

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
        title: Text("edit_profile".tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            SizedBox(height: 30),
            _buildTextField(
                controller: _genderController, labelText: "names".tr),
            SizedBox(height: 20),
            _buildTextField(
                controller: _genderController, labelText: "gender".tr),
            SizedBox(height: 20),
            _buildTextField(
                controller: _phoneController, labelText: "phone_number".tr),
            SizedBox(height: 20),
            _buildTextField(
                controller: _passwordController, labelText: "password".tr),
            SizedBox(height: 20),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            "assets/images/image.png",
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vean Vong",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("098765445 | Male"),
            SizedBox(height: 5),
            GestureDetector(
              onTap: _showPhotoOptions,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.upload, color: Colors.blue, size: 15),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: labelText,
      ),
    );
  }

  Widget _buildSaveButton() {
    return Center(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: _saveProfile,
          child: Text(
            "save".tr,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 120,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.photo),
                title: Text("select_photo".tr),
                onTap: () {
                  // Handle photo selection
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("take_photo".tr),
                onTap: () {
                  // Handle taking a new photo
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveProfile() {
    final name = _nameController.text;
    final gender = _genderController.text;
    final phone = _phoneController.text;
    final password = _passwordController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile saved: $name, $gender, $phone'),
      ),
    );
  }
}
