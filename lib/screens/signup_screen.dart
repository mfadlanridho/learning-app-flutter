import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_learning/constants.dart';
import 'package:online_learning/screens/login_screen.dart';
import 'package:online_learning/screens/navigation_screen.dart';
import 'package:online_learning/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/auth_input_field.dart';

const double kHorizontalPadding = 24;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(kPadding),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1F1F39),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(kPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthInputField(
                      keyboardType: TextInputType.emailAddress,
                      title: 'Email',
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: kPadding,
                    ),
                    AuthInputField(
                      title: 'Password',
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: kPadding,
                    ),
                    Button(
                      title: 'Create Account',
                      onPressed: () async {
                        try {
                          final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          if (newUser != null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => NavigationScreen()),
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      padding: kPadding,
                      borderRadius: 12,
                    ),
                    SizedBox(
                      height: kPadding,
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
            ),
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
          ),
        ),
      ],
    );
  }
}
