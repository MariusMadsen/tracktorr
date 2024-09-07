import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';

class MovieTileInfo extends StatelessWidget {
  const MovieTileInfo({super.key, required this.movie});

  final Movie movie;

  String getYear() {
    return movie.releaseDate.substring(0, 4);
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
            "${movie.title} (${getYear()})",
          ),
        ),
        // MovieTileIcons(
        //   movie: movie,
        // )
      ],
    );
  }
}
