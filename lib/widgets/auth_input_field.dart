import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final String title;

  const AuthInputField({Key? key, required this.title}) : super(key: key);

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
        ),
      ],
    );
  }
}
