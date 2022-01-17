import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Notifications'),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text('message'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('notifications'),
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/girl.png',
                      height: 48,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bert Pullman'),
                        Text('Online'),
                      ],
                    ),
                    Text('04:32 pm'),
                  ],
                ),
                Text('Congratulations on completing the first lesson, keep up the good work!')
              ],
            ),
          )
        ],
      ),
    );
  }
}
