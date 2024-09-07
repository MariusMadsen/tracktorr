import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';
import 'package:laruina/widgets/movies/movie_cast.dart';

class DetailedMovieCast extends StatelessWidget {
  const DetailedMovieCast({super.key, required this.detailedMovie});

  final DetailedMovie detailedMovie;

  @override
  Widget build(BuildContext context) {
    return DetailedMoviePadding(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Text(
            "Cast",
            style: TextStyle(fontSize: 24),
          ),
          MovieCastList(
            detailedMovie: detailedMovie,
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
