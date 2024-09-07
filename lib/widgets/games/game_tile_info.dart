import 'package:flutter/material.dart';
import 'package:laruina/contracts/games_contracts.dart';

class GameTileInfo extends StatelessWidget {
  const GameTileInfo({super.key, required this.game});

  final Game game;

  String getYear() {
    return game.releasedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "${game.name} (${getYear()})",
            ),
          ),
        ]);
  }
}
