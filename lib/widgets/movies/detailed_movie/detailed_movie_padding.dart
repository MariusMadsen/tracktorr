import 'package:flutter/material.dart';

class DetailedMoviePadding extends StatelessWidget {
  const DetailedMoviePadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: child,
    );
  }
}
