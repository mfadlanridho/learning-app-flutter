import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HyperlinkText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const HyperlinkText(
    this.text, {
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: text,
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
