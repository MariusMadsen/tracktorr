import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/widgets/common/tile_icon.dart';

class MovieTileIcons extends StatelessWidget {
  const MovieTileIcons({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          if (movie.watched) const TileIcon(icon: FontAwesomeIcons.eye),
          if (movie.liked) const TileIcon(icon: FontAwesomeIcons.thumbsUp),
          if (movie.watched && !movie.liked)
            const TileIcon(icon: FontAwesomeIcons.thumbsDown),
          if (movie.owned) const TileIcon(icon: FontAwesomeIcons.crown)
        ],
      ),
    );
  }
}
