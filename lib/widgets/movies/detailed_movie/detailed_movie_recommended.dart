import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';
import 'package:laruina/provider/single_movie_model.dart';
import 'package:laruina/widgets/common/cover_card.dart';
import 'package:provider/provider.dart';

class DetailedMovieRecommendedMovies extends StatelessWidget {
  const DetailedMovieRecommendedMovies(
      {super.key, required this.detailedMovie});

  final DetailedMovie detailedMovie;

  @override
  Widget build(BuildContext context) {
    return DetailedMoviePadding(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          if (detailedMovie.recommendedMovies.isNotEmpty)
            const Text(
              "People also watch",
              style: TextStyle(fontSize: 24),
            ),
          if (detailedMovie.recommendedMovies.isNotEmpty)
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: detailedMovie.recommendedMovies
                    .map((e) => Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<SingleMovieModel>()
                                  .get(e.id, context);
                            },
                            child: CoverCard(
                                img:
                                    "https://image.tmdb.org/t/p/original/${e.img}"),
                          ),
                        ))
                    .toList(),
              ),
            ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
