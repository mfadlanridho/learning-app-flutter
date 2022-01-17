import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Account'),
            Center(child: CircleAvatar()),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Favourite'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
