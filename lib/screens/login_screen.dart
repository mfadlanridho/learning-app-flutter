import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_learning/items/all_courses_list.dart';
import 'package:online_learning/items/course.dart';
import 'package:online_learning/items/courses_list.dart';
import 'package:online_learning/pages/home_page.dart';
import 'package:online_learning/constants.dart';
import 'package:online_learning/screens/navigation_screen.dart';

import '../widgets/auth_input_field.dart';
import '../widgets/button.dart';
import '../widgets/hyperlink_text.dart';

const double kHorizontalPadding = 24;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  String authErrorText = "";

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
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
                  'Log In',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      title: 'Log In',
                      onPressed: () async {
                        try {
                          final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => NavigationScreen()),
                            );
                          }
                        } catch (e) {
                          print(e);
                          setState(() {
                            String str = e.toString();
                            var parts = str.split(']');
                            var error = parts.sublist(1);
                            authErrorText = error.toString();
                          });
                        }
                      },
                    ),
                    Text(authErrorText),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account? '),
                        HyperlinkText('Sign Up', onTap: () => Navigator.pop(context)),
                      ],
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
