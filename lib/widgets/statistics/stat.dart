import 'package:flutter/material.dart';

class Stat extends StatelessWidget {
  const Stat({super.key, required this.score, required this.icon});

  final int score;
  final IconData icon;
  final int scoreLength = 5;

  @override
  Widget build(BuildContext context) {
    String scoreText = "$score ";
    String paddedScore = "";
    for (var i = 0; i < scoreLength - scoreText.length; i++) {
      paddedScore = "${paddedScore}_";
    }
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "$paddedScore ",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.transparent,
              ),
            ),
            TextSpan(
              text: "$score ",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            WidgetSpan(
              child: Icon(icon),
            ),
          ],
        ),
      ),
    );
  }
}
