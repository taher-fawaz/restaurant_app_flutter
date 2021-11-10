import 'package:flutter/material.dart';

class HeadlineRow extends StatelessWidget {
  final String? headlineTitle;
  final String? page;
  const HeadlineRow({Key? key, this.headlineTitle, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$headlineTitle",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          child: Text(
            "See all",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, page!);
          },
        ),
      ],
    );
  }
}
