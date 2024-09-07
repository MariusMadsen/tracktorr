import 'package:flutter/material.dart';

class RouteAnimationService {
  RouteAnimationService._();

  static Route createRoute(
      {required Widget page,
      Offset offset = const Offset(1, 0),
      Duration duration = const Duration(milliseconds: 500)}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          Offset begin = offset;
          const end = Offset.zero;
          const curve = Curves.easeOutExpo;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        },
        transitionDuration: duration);
  }
}
