import 'package:flutter/material.dart';
import 'package:online_learning/pages/home_page.dart';
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
  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);

    return Scaffold(
      backgroundColor: Color(0xFFF0F0F2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Log In',
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AuthInputField(title: 'Email'),
                    AuthInputField(title: 'Password'),
                    Button(
                      title: 'Log In',
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => NavigationScreen()),
                        );
                      },
                    ),
                    HyperlinkText(
                      'Forget Password?',
                      onTap: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account? '),
                        HyperlinkText('Sign Up', onTap: () => Navigator.pop(context)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: Divider(thickness: 1)),
                        Text('Or login with'),
                        Expanded(child: Divider(thickness: 1)),
                      ],
                    ),
                    Center(child: Image.asset('images/google.png'))
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
