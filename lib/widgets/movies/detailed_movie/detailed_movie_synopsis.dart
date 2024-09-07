import 'package:flutter/material.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';

class DetailedMovieSynopsis extends StatelessWidget {
  const DetailedMovieSynopsis({super.key, required this.synopsis});

  final String synopsis;

  @override
  Widget build(BuildContext context) {
    return DetailedMoviePadding(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Text(
            "Synopsis",
            style: TextStyle(fontSize: 24),
          ),
          Text(synopsis),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
