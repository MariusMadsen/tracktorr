import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/provider/movies_model.dart';
import 'package:laruina/provider/single_movie_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:provider/provider.dart';

class WatchMovieDialog extends StatelessWidget {
  const WatchMovieDialog({super.key, this.detailedMovie, this.movie});

  final DetailedMovie? detailedMovie;
  final Movie? movie;

  Future<void> detailedMovieWatch(bool liked, BuildContext context) async {
    return await context
        .read<SingleMovieModel>()
        .watchMovie(detailedMovie!, liked, context);
  }

  Future<void> movieWatch(bool liked, BuildContext context) async {
    return await context.read<MoviesModel>().watchMovie(movie!, liked, context);
  }

  watch(bool liked, BuildContext context) async {
    if (detailedMovie != null) {
      await detailedMovieWatch(liked, context).whenComplete(() {
        Navigator.pop(context);
      });
    } else if (movie != null) {
      await movieWatch(liked, context)
          .whenComplete(() => Navigator.pop(context));
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Did you like the movie?",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        GestureDetector(
            onTap: () async => await watch(true, context),
            child: const Icon(FontAwesomeIcons.thumbsUp)),
        GestureDetector(
            onTap: () async {
              await watch(false, context);
            },
            child: const Icon(FontAwesomeIcons.thumbsDown))
      ],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      backgroundColor: ThemeColors.bottomNavbar(),
    );
  }
}
