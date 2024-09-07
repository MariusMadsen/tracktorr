import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/provider/single_movie_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_cast.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_director.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_friends_have_watched.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_genres.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_header.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_providers.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_recommended.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_synopsis.dart';
import 'package:provider/provider.dart';

class DetailedMoviePage extends StatelessWidget {
  const DetailedMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: Consumer<SingleMovieModel>(
        builder: (context, value, child) {
          if (value.detailedMovie.isEmpty) {
            return Container();
          }

          DetailedMovie detailedMovie = value.detailedMovie.last;
          debugPrint(detailedMovie.toString());

          return Center(
            child: ListView(
              children: [
                DetailedMovieHeader(detailedMovie: detailedMovie),
                DetailedMovieSynopsis(synopsis: detailedMovie.description),
                DetailedMovieGenres(detailedMovie: detailedMovie),
                DetailedMovieProviders(detailedMovie: detailedMovie),
                DetailedMovieCast(detailedMovie: detailedMovie),
                DetailedMovieDirector(detailedMovie: detailedMovie),
                DetailedMovieFriendsHaveWatched(detailedMovie: detailedMovie),
                DetailedMovieRecommendedMovies(detailedMovie: detailedMovie)
              ],
            ),
          );
        },
      ),
    );
  }
}
