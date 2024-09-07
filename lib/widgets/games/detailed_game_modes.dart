import 'package:flutter/material.dart';
import 'package:laruina/contracts/games_contracts.dart';
import 'package:laruina/statics/colors.dart';

class DetailedGameModes extends StatelessWidget {
  const DetailedGameModes({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Gamemodes",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Wrap(
          spacing: 5,
          children: game.genres
              .map((e) => Chip(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    backgroundColor: ThemeColors.bottomNavbar(),
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
