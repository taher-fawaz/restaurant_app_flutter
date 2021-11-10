import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final Function(String)? onItemClick;

  const MenuWidget({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              radius: 65,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profileCropped.jpg'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Nick',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'BalsamiqSans'),
            ),
            const SizedBox(
              height: 20,
            ),
            sliderItem('Home', Icons.home),
            sliderItem('Add Meal', Icons.add_circle),
            sliderItem('Notification', Icons.notifications_active),
            sliderItem('Favourites', Icons.favorite),
            sliderItem('Setting', Icons.settings),
            sliderItem('LogOut', Icons.arrow_back_ios)
          ],
        ),
      ),
    );
  }

  Widget sliderItem(String title, IconData icons) => ListTile(
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontFamily: 'BalsamiqSans_Regular'),
      ),
      leading: Icon(
        icons,
        color: Colors.black,
      ),
      onTap: () {
        onItemClick!(title);
      });
}
