import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? padding;
  final double? borderRadius;

  const Button({
    Key? key,
    required this.title,
    required this.onPressed,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 4),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFF3D5CFF),
        ),
        onPressed: onPressed,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(padding ?? 0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
