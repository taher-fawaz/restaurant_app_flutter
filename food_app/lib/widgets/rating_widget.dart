import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  final int maximumRating;
  final Function(int) onRatingSelected;

  const Rating(this.onRatingSelected, {Key? key, this.maximumRating = 5})
      : super(key: key);

  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return const Icon(Icons.star, color: Colors.orange);
    } else {
      return const Icon(Icons.star_border_outlined);
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(widget.maximumRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRating = index + 1;
          });

          widget.onRatingSelected(_currentRating);
        },
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: stars,
        ),
        TextButton(
          child: const Text("Clear", style: TextStyle(color: Colors.blue)),
          onPressed: () {
            setState(() {
              _currentRating = 0;
            });
            widget.onRatingSelected(_currentRating);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
