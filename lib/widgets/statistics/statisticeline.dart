import 'package:flutter/material.dart';
import 'package:laruina/widgets/statistics/stat.dart';

class StatisticLine extends StatelessWidget {
  const StatisticLine({super.key, required this.title, required this.stat});

  final String title;
  final List<Stat> stat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(letterSpacing: 1),
          ),
          Row(
            children: stat,
          )
        ],
      ),
    );
  }
}
