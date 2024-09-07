import 'package:flutter/material.dart';

class CoverCard extends StatelessWidget {
  const CoverCard({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.transparent,
          child: Image.network(
            img,
            height: 150,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
