import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:online_learning/screens/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const decoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 22, color: Color(0xFF1F1F39)),
      bodyTextStyle: TextStyle(fontSize: 16, color: Color(0xFF858597)),
    );

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Numerous free\ntrial courses',
          body: 'Free courses for you to find\nyour way to learning',
          image: Center(child: Image.asset('images/illustration01.png', height: 260.0)),
          decoration: decoration,
        ),
        PageViewModel(
          title: 'Quick and easy\nlearning',
          body: 'Easy and fast learning at any\ntime to help you improve\nvarious skills',
          image: Center(child: Image.asset('images/illustration02.png', height: 260.0)),
          decoration: decoration,
        ),
        PageViewModel(
          title: 'Create your own\nstudy plan',
          body: 'Study according to the study\nplan, make study more\nmotivated',
          image: Center(child: Image.asset('images/illustration03.png', height: 260.0)),
          decoration: decoration,
        ),
      ],
      done: const Text('Sign Up'),
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      },
      showNextButton: false,
      dotsDecorator: DotsDecorator(
        color: Color(0xFFBDBDBD),
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
