import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';

class DetailedMovieProviders extends StatelessWidget {
  const DetailedMovieProviders({super.key, required this.detailedMovie});

  final DetailedMovie detailedMovie;

  @override
  Widget build(BuildContext context) {
    return DetailedMoviePadding(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Text(
            "Watch it on",
            style: TextStyle(fontSize: 24),
          ),
          Text(detailedMovie.providers
              .map((e) => e.providerName)
              .toList()
              .join(", ")),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
