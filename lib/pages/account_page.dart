import 'package:flutter/material.dart';
import 'package:online_learning/constants.dart';
import 'package:online_learning/screens/login_screen.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: TextStyle(
                  fontSize: kTitleFontSize,
                ),
              ),
              Center(child: CircleAvatar()),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        title: Text('Logout'),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
