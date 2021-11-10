import 'package:flutter/material.dart';
import '../../../util/friends.dart';

class BuildFriendsList extends StatelessWidget {
  const BuildFriendsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          final String img = friends[index];

          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                img,
              ),
              radius: 20.0,
            ),
          );
        },
      ),
    );
  }
}
