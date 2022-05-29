import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final String title;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;

  const AuthInputField({
    Key? key,
    required this.title,
    required this.onChanged,
    this.obscureText = false,
    TextInputType? this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          style: TextStyle(
            fontSize: 14,
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: 'Enter your ${title.toLowerCase()}',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onChanged: onChanged,
        ),
      ],
    );
  }
}
