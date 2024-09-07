import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/games_contracts.dart';
import 'package:laruina/provider/games_model.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_user_info.dart';
import 'package:provider/provider.dart';

class DetailedGameUserInfo extends StatelessWidget {
  const DetailedGameUserInfo({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 10,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!game.notCompletable)
            DetailedMovieUserButton(
              icon: FontAwesomeIcons.check,
              action: () {
                if (game.completed) {
                  context.read<GamesModel>().uncompleteGame(context, game);
                } else {
                  context.read<GamesModel>().completeGame(context, game);
                }
              },
              visible: true,
              enabled: game.completed,
            ),
          DetailedMovieUserButton(
            icon: FontAwesomeIcons.heart,
            action: () {
              if (game.prioritized) {
                context.read<GamesModel>().unpriotitize(context, game);
              } else {
                context.read<GamesModel>().prioritize(context, game);
              }
            },
            visible: game.owns,
            enabled: game.prioritized,
          ),
          DetailedMovieUserButton(
            icon: FontAwesomeIcons.crown,
            action: () {
              if (game.owns) {
                context.read<GamesModel>().own(context, game);
              } else {
                context.read<GamesModel>().disown(context, game);
              }
            },
            visible: true,
            enabled: game.owns,
          )
        ],
      ),
    );
  }
}
