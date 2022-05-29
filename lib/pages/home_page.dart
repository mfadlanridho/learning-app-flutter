import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_learning/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 183,
                color: Color(0xff3D5CFF),
              ),
            ],
          ),
          Column(children: [
            ProfileHeader(),
            LearningProgress(),
            DashboardCard(),
            LearningPlanCard(),
          ])
        ],
      ),
    );
  }
}

class LearningPlanCard extends StatelessWidget {
  const LearningPlanCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learning Plan',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                LearningPlanListTile(),
                LearningPlanListTile(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LearningPlanListTile extends StatelessWidget {
  const LearningPlanListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle),
        Text('Packaging Design'),
        Text('40/48'),
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 155,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xffCEECFE),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you\nwant to learn\ntoday?',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffFF6905),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Image.asset(
              'images/illustration04.png',
            ),
          ),
        ],
      ),
    );
  }
}

class LearningProgress extends StatelessWidget {
  const LearningProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Learned today',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff858597),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  minimumSize: Size(0, 0),
                ),
                child: Text(
                  'My Courses',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '46min',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '/ 60min',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xff858597),
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          Divider(
            thickness: 10,
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${FirebaseAuth.instance.currentUser!.email}',
                style: TextStyle(
                  fontSize: kTitleFontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Let\'s start learning',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          CircleAvatar(),
        ],
      ),
    );
  }
}
