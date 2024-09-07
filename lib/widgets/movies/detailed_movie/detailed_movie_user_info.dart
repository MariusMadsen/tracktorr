import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/provider/single_movie_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/movies/watch_movie_dialog.dart';
import 'package:provider/provider.dart';

class DetailedMovieUserInfo extends StatelessWidget {
  const DetailedMovieUserInfo({super.key, required this.detailedMovie});

  final DetailedMovie detailedMovie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 10,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DetailedMovieUserButton(
            icon: FontAwesomeIcons.eye,
            action: () {
              showDialog(
                  context: context,
                  builder: (context) => WatchMovieDialog(
                        detailedMovie: detailedMovie,
                      ));
            },
            visible: true,
            enabled: detailedMovie.watched,
          ),
          DetailedMovieUserButton(
            icon: FontAwesomeIcons.thumbsUp,
            action: () {
              context.read<SingleMovieModel>().like(detailedMovie, context);
            },
            visible: detailedMovie.watched,
            enabled: detailedMovie.liked,
          ),
          DetailedMovieUserButton(
            icon: FontAwesomeIcons.crown,
            action: () {
              context.read<SingleMovieModel>().own(detailedMovie, context);
            },
            visible: true,
            enabled: detailedMovie.owned,
          )
        ],
      ),
    );
  }
}

class DetailedMovieUserButton extends StatelessWidget {
  const DetailedMovieUserButton(
      {super.key,
      required this.icon,
      required this.action,
      required this.enabled,
      required this.visible});

  final IconData icon;
  final Function action;
  final bool enabled;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    if (!visible) return Container();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: IconButton(
          onPressed: () => action(),
          icon: Icon(icon,
              color: enabled ? ThemeColors.yes() : ThemeColors.accent()),
          style: ButtonStyle(
            shape: WidgetStateProperty.all(const CircleBorder()),
            padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
            backgroundColor: WidgetStateProperty.all(
                ThemeColors.bottomNavbar()), // <-- Button color
          )),
    );
  }
}
