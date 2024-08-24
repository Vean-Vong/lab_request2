import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameController = TextEditingController(text: "Vean Vong");
  final _genderController = TextEditingController(text: "Male");
  final _phoneController = TextEditingController(text: "098765445");

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
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture and Information
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vean Vong",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text("098765445 | Male"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Name Field
            _buildTextField(
              controller: _nameController,
              labelText: "Name",
            ),
            SizedBox(height: 20),
            // Gender Field
            _buildTextField(
              controller: _genderController,
              labelText: "Gender",
            ),
            SizedBox(height: 20),
            // Phone Number Field
            _buildTextField(
              controller: _phoneController,
              labelText: "Phone Number",
            ),
            SizedBox(height: 20),
            // Save Button
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 6, 70, 166),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: _saveProfile,
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: labelText,
        ),
      ),
    );
  }

  // Save button action
  void _saveProfile() {
    // Implement save functionality
    final name = _nameController.text;
    final gender = _genderController.text;
    final phone = _phoneController.text;

    // For demonstration, show the profile data in a Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile saved: $name, $gender, $phone'),
      ),
    );
  }
}
