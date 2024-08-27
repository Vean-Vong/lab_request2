import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Button background color
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
