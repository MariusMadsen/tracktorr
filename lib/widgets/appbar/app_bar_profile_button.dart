import 'package:flutter/material.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/pages/hub/profile_page.dart';
import 'package:laruina/services/route_animation_service.dart';

class AppBarProfileButton extends StatelessWidget {
  const AppBarProfileButton(
      {super.key, required this.userAvatar, required this.user});

  final Widget userAvatar;
  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            RouteAnimationService.createRoute(page: ProfilePage(user: user)));
      },
      child: userAvatar,
    );
  }
}
