import 'package:flutter/material.dart';
import 'package:laruina/statics/colors.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, this.size = 20, required this.url});

  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ThemeColors.bottomNavbar(),
      radius: size + 2,
      child: CircleAvatar(
        radius: size,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}
