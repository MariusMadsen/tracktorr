import 'dart:math';

import 'package:flutter/material.dart';

class ThemeColors {
  ThemeColors._();

  static Color text() {
    return Colors.white;
  }

  static Color backGround() {
    // return random();
    return const Color.fromRGBO(96, 50, 119, 1);
  }

  // static Color accent() {
  //   return const Color.fromRGBO(230, 82, 14, 1);
  // }

  static Color accent() {
    return const Color.fromRGBO(159, 205, 136, 1);
  }

  static Color harmonyOne() {
    return const Color.fromRGBO(119, 96, 50, 1);
  }

  static Color harmonyTwo() {
    return const Color.fromRGBO(50, 119, 96, 1);
  }

  static Color yes() {
    return const Color.fromARGB(255, 52, 244, 68);
  }

  static Color bottomNavbar() {
    return const Color.fromARGB(255, 97, 10, 140);
  }

  static Color transparent() {
    return Colors.transparent;
  }

  static Color random() {
    Random random = Random();

    return Color.fromRGBO(random.nextInt(256), random.nextInt(160),
        random.nextInt(160), random.nextDouble());
  }
}
