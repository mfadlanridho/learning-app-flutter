import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_learning/screens/login_screen.dart';
import 'package:online_learning/screens/navigation_screen.dart';
import 'package:online_learning/widgets/button.dart';

import '../widgets/auth_input_field.dart';

const double kHorizontalPadding = 24;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    bool agreed = false;

    return Scaffold(
      backgroundColor: Color(0xFFF0F0F2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F1F39),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthInputField(
                      title: 'Email',
                    ),
                    AuthInputField(
                      title: 'Password',
                    ),
                    Button(
                      title: 'CreateAccount',
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => NavigationScreen()),
                        );
                      },
                    ),
                    TermsAndConditionsCheckbox(agreed: agreed),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({
    Key? key,
    required this.agreed,
  }) : super(key: key);

  final bool agreed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: agreed,
          onChanged: (value) {},
        ),
        Expanded(
            child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: 'By creating this account you agree with our ', style: DefaultTextStyle.of(context).style),
              TextSpan(
                text: 'terms & conditions.',
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        )
            // Text(
            //   'By creating this account you agree with our terms & conditions.',
            // ),
            ),
      ],
    );
  }
}
