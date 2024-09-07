import 'package:flutter/material.dart';
import 'package:laruina/contracts/games_contracts.dart';
import 'package:laruina/statics/colors.dart';

class DetailedGamePlatforms extends StatelessWidget {
  const DetailedGamePlatforms({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    debugPrint(game.ownedPlatforms.toString());
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Platforms",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Wrap(
          spacing: 5,
          children: game.platforms
              .map((e) => Chip(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    backgroundColor: game.ownedPlatforms.contains(e)
                        ? ThemeColors.yes()
                        : ThemeColors.bottomNavbar(),
                    label: Text(
                      e,
                      style: TextStyle(color: ThemeColors.text()),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
