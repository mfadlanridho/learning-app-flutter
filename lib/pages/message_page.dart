import 'package:flutter/material.dart';
import 'package:online_learning/constants.dart';
import 'package:online_learning/widgets/shadowed_box.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: kTitleFontSize,
              ),
            ),
            SizedBox(height: kPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MessagesSelectionButton(),
                MessagesSelectionButton(),
              ],
            ),
            SizedBox(
              height: kPadding,
            ),
            ShadowedBox(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'images/girl.png',
                          height: 48,
                          width: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bert Pullman',
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Online',
                            style: TextStyle(
                              color: Color(0xff858597),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '04:32 pm',
                        style: TextStyle(
                          color: Color(0xff858597),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Congratulations on completing the first lesson, keep up the good work!',
                    style: TextStyle(
                      color: Color(0xff858597),
                    ),
                  ),
                ],
              ),
              padding: 20,
            )
          ],
        ),
      ),
    );
  }
}

class MessagesSelectionButton extends StatelessWidget {
  const MessagesSelectionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Column(
        children: [
          Text(
            'messages',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 2,
            width: 42,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xff3D5CFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
