import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ProfileHeader(),
          LearningProgress(),
          DashboardCard(),
          LearningPlanCard(),
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
      child: Column(
        children: [
          Text('Learning Plan'),
          LearningPlanListTile(),
          LearningPlanListTile(),
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
      child: Row(
        children: [
          Column(
            children: [
              Text('What do you want to learn today?'),
              TextButton(
                onPressed: () {},
                child: Text('Get Started'),
              ),
            ],
          ),
          Image.asset('images/illustration04.png'),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Learned today'),
              Text('My Courses'),
            ],
          ),
          Row(
            children: [
              Text('46min'),
              SizedBox(width: 10),
              Text('/ 60min'),
            ],
          ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, Kristin'),
            Text('Let\'s start learning'),
          ],
        ),
        CircleAvatar(),
      ],
    );
  }
}
