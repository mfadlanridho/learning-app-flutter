import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.search),
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: 'Find Course'),
            ),
          ),
          TextButton(onPressed: () {}, child: Icon(Icons.notes))
        ],
      ),
    );
  }
}
