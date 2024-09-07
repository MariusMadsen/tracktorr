import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';

class DetailedMovieGenres extends StatelessWidget {
  const DetailedMovieGenres({super.key, required this.detailedMovie});

  final DetailedMovie detailedMovie;

  @override
  Widget build(BuildContext context) {
    return DetailedMoviePadding(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Text(
            "Genres",
            style: TextStyle(fontSize: 24),
          ),
          Text(detailedMovie.genres.join(", ")),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
