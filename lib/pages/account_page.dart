import 'package:flutter/material.dart';
import 'package:online_learning/constants.dart';

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
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Favourite'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      contentPadding: EdgeInsets.all(0),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
