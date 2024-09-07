import 'package:flutter/material.dart';
import 'package:laruina/contracts/comics_contracts.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';

class DetailedComicPublisher extends StatelessWidget {
  const DetailedComicPublisher({super.key, required this.comicVolume});

  final DetailedVolume comicVolume;

  @override
  Widget build(BuildContext context) {
    return DetailedMoviePadding(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Text(
            "Published by",
            style: TextStyle(fontSize: 24),
          ),
          Text(comicVolume.publisher),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
