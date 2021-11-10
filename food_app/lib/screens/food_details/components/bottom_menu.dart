import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: const <Widget>[
              Icon(
                Icons.timelapse,
                color: Color(0xFF404aff),
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "12pm-3pm",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          Column(
            children: const <Widget>[
              Icon(
                Icons.directions,
                color: Color(0xFF23c58a),
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "3.5 km",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          Column(
            children: const <Widget>[
              Icon(
                Icons.map,
                color: Color(0xFFff0654),
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Map View",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          Column(
            children: const <Widget>[
              Icon(
                Icons.directions_bike,
                color: Color(0xFFe95959),
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Delivery",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ],
      ),
    );
  }
}
