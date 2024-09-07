import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/widgets/common/avatar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final cloudinary =
        CloudinaryPublic('ragingmmonkey', 'UPLOAD_PRESET', cache: false);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            const SizedBox(
              height: 50,
            ),
            UserAvatar(
              url: cloudinary.getImage("profiles/${user.id}").url,
              size: 50,
            ),
            Text(
              user.username,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28),
            ),
            Text(
              "${user.firstName}${user.middleName.isEmpty ? '' : ' ${user.middleName}'} ${user.lastName}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              user.email,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
            const SizedBox(
              height: 50,
            ),
            ExternalLinks(user: user)
          ],
        ),
      ),
    );
  }
}

class ExternalLinks extends StatelessWidget {
  const ExternalLinks({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExternalLink(icon: FontAwesomeIcons.steam, id: user.steamId),
        ExternalLink(icon: FontAwesomeIcons.xbox, id: user.xboxUser.gamertag),
        ExternalLink(
            icon: FontAwesomeIcons.playstation,
            id: user.playstationUser.username),
      ],
    );
  }
}

class ExternalLink extends StatelessWidget {
  const ExternalLink({super.key, required this.icon, required this.id});

  final IconData icon;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 34,
          ),
          Text(
            id,
            style: const TextStyle(fontSize: 22),
          )
        ],
      ),
    );
  }
}
