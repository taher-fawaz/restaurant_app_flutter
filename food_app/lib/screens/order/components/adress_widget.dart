import 'package:flutter/material.dart';
import '../../../widgets/rounded_checkbox.dart';

class AdressWidget extends StatelessWidget {
  final String? place;
  final String? adress;
  const AdressWidget({Key? key, @required this.place, @required this.adress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: const LinearGradient(
          begin: Alignment(0.0, -1.0),
          end: Alignment(0.0, 1.0),
          colors: [Color(0xFFF5F5F5), Color(0xfff5f2f2)],
          stops: [0.0, 1.0],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text(
              place!,
              style: const TextStyle(
                // fontFamily: 'Segoe UI',
                fontSize: 18,
                color: Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                adress!,
                style: const TextStyle(
                  // fontFamily: 'Segoe UI',
                  fontSize: 18,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.left,
              ),
              // Adobe XD layer: 'iconfinder_feature-…' (shape)
              RoundCheckBox(
                onTap: (selected) {},
                checkedColor: Theme.of(context).colorScheme.secondary,
                animationDuration: const Duration(milliseconds: 200),
              ),
            ],
          )
        ],
      ),
    );
  }
}
