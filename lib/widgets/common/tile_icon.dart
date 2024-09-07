import 'package:flutter/material.dart';

class TileIcon extends StatelessWidget {
  const TileIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: Icon(icon),
    );
  }
}
