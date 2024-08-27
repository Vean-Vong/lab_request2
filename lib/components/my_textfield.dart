import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool obsureText;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.keyboardType,
    required this.isPassword,
    required this.obsureText,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword && obscureText,
          decoration: InputDecoration(
            hintText: widget.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
