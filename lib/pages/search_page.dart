import 'package:flutter/material.dart';
import 'package:online_learning/widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SearchBar(),
    );
  }
}
