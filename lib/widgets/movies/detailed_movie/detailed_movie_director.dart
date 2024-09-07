import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';
import 'package:laruina/provider/movie_person_model.dart';
import 'package:laruina/services/movies_service.dart';
import 'package:laruina/widgets/common/avatar.dart';
import 'package:provider/provider.dart';

class DetailedMovieDirector extends StatelessWidget {
  const DetailedMovieDirector({super.key, required this.detailedMovie});

  final DetailedMovie detailedMovie;

  @override
  Widget build(BuildContext context) {
    return DetailedMoviePadding(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Text(
            "Directed by",
            style: TextStyle(fontSize: 24),
          ),
          GestureDetector(
            onTap: () {
              context
                  .read<MoviePersonModel>()
                  .get(detailedMovie.director!.id, context);
            },
            child: Row(
              children: [
                UserAvatar(
                  url:
                      MoviesService.buildImgUrl(detailedMovie.director!.img),
                ),
                Text(detailedMovie.director!.name),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
