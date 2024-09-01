import 'package:flutter/material.dart';

class DeletionConfirmationScreen extends StatelessWidget {
  const DeletionConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Deleted"),
      ),
      body: Center(
        child: const Text(
          'The request has been successfully deleted.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
