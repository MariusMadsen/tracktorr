import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';
import 'package:laruina/provider/single_movie_model.dart';
import 'package:laruina/services/movies_service.dart';
import 'package:laruina/widgets/common/cover_card.dart';
import 'package:provider/provider.dart';

class MoviePersonContributedOnMovies extends StatelessWidget {
  const MoviePersonContributedOnMovies(
      {super.key, required this.movies, required this.topic});

  final String topic;
  final List<Movie>? movies;

  @override
  Widget build(BuildContext context) {
    if (movies == null || movies!.isEmpty) {
      return Container();
    }
    return DetailedMoviePadding(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          if (movies!.isNotEmpty)
            Text(
              topic,
              style: const TextStyle(fontSize: 24),
            ),
          if (movies!.isNotEmpty)
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: movies!
                    .map((e) => GestureDetector(
                          onTap: () {
                            context.read<SingleMovieModel>().get(e.id, context);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: CoverCard(
                                img: MoviesService.buildImgUrl(e.img)),
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
