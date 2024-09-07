import 'package:flutter/material.dart';
import 'package:laruina/contracts/games_contracts.dart';
import 'package:laruina/provider/single_game_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/games/detailed_game_genres.dart';
import 'package:laruina/widgets/games/detailed_game_header.dart';
import 'package:laruina/widgets/games/detailed_game_modes.dart';
import 'package:laruina/widgets/games/detailed_game_platforms.dart';
import 'package:provider/provider.dart';

class DetailedGamePage extends StatelessWidget {
  const DetailedGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: Consumer<SingleGameModel>(
        builder: (context, value, child) {
          if (value.selectedGame.isEmpty) {
            return Container();
          }

          Game game = value.selectedGame.last;
          return Center(
            child: ListView(
              children: [
                DetailedGameHeader(game: game),
                DetailedGamePlatforms(game: game),
                DetailedGameModes(game: game),
                DetailedGameGenres(game: game)
              ],
            ),
          );
        },
      ),
    );
  }
}
