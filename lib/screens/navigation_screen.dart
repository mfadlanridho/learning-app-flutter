import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_learning/pages/account_page.dart';
import 'package:online_learning/pages/courses_page.dart';
import 'package:online_learning/pages/create_course_page.dart';
import 'package:online_learning/pages/home_page.dart';
import 'package:online_learning/pages/message_page.dart';
import 'package:online_learning/pages/search_page.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  void getCurrentUser() {
    User? user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(user.email);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    // HomePage(),
    CoursesPage(),
    SearchPage(),
    CreateCoursePage(),
    // MessagePage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Create Crouse',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.message),
          //   label: 'Message',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF3D5CFF),
        onTap: _onItemTapped,
      ),
    );
  }
}
