import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';

class MoviePersonBiography extends StatelessWidget {
  const MoviePersonBiography({super.key, required this.moviePerson});

  final MoviePerson moviePerson;

  @override
  Widget build(BuildContext context) {
    return DetailedMoviePadding(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Text(
            "Biography",
            style: TextStyle(fontSize: 24),
          ),
          Text(moviePerson.biography!),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
