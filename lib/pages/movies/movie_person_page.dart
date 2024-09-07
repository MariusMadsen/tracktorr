import 'package:flutter/material.dart';
import 'package:laruina/provider/movie_person_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/movies/movie_person/movie_person_biography.dart';
import 'package:laruina/widgets/movies/movie_person/movie_person_contributed_movies.dart';
import 'package:laruina/widgets/movies/movie_person/movie_person_header.dart';
import 'package:provider/provider.dart';

class MoviePersonPage extends StatelessWidget {
  const MoviePersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: SafeArea(
        child: Consumer<MoviePersonModel>(
          builder: (context, value, child) {
            if (value.moviePersons.isEmpty) {
              return Container();
            }

            final moviePerson = value.moviePersons.last;

            return Center(
              child: ListView(
                children: [
                  MoviePersonHeader(moviePerson: moviePerson),
                  MoviePersonBiography(moviePerson: moviePerson),
                  MoviePersonContributedOnMovies(
                    movies: moviePerson.actedIn,
                    topic: "Acted in",
                  ),
                  MoviePersonContributedOnMovies(
                    movies: moviePerson.created,
                    topic: "Helped make",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
