import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/services/loader.dart';
import 'package:laruina/services/movies_service.dart';
import 'package:laruina/services/route_animation_service.dart';
import 'package:laruina/widgets/movies/movies.dart';

class MoviesModel extends ChangeNotifier {
  MovieResponse? movieResponse; // Store the whole response here
  MovieResponse? filteredResult; // locally filtered response
  Function reGet = () {}; // Store the latest function used to refetch from BE
  String _text = ""; // searchtext used in filter
  bool _friendFilter = false; // Set to true when selecting grouprecommended
  List<Friend> friends = [];

  void clear() {
    movieResponse = null;
    filteredResult = null;
    _text = "";
    _friendFilter = false;
    reGet = () {};
    notifyListeners();
  }

  void filter(String text) {
    if (movieResponse == null) {
      return;
    }
    _text = text; // Set text incase of refetch
    filteredResult = movieResponse!.copyWith(
        movies: movieResponse!.movies
            .where((element) =>
                element.title.toLowerCase().contains(_text.toLowerCase()))
            .toList());
    notifyListeners();
    debugPrint("Inner searched yielded ${filteredResult!.movies.length}");
  }

  Future<void> watchMovie(Movie movie, bool liked, BuildContext context) async {
    Loader.load(context);
    await MoviesService.watchMovie(movie, liked)
        .then((value) async => await refresh())
        .whenComplete(() {
      Loader.loadComplete(context);
    });
  }

  Future<void> like(Movie movie, BuildContext context) async {
    Loader.load(context);
    if (movie.liked) {
      await MoviesService.dislike(movie.id)
          .then((value) async => await refresh())
          .whenComplete(() {
        Loader.loadComplete(context);
      });
    } else {
      await MoviesService.like(movie.id)
          .then((value) async => await refresh())
          .whenComplete(() {
        Loader.loadComplete(context);
      });
    }
  }

  Future<void> own(Movie movie, BuildContext context) async {
    Loader.load(context);
    if (movie.owned) {
      await MoviesService.disownMovie(movie.id)
          .then((value) async => await refresh())
          .whenComplete(() {
        Loader.loadComplete(context);
      });
    } else {
      await MoviesService.ownMovie(movie.id)
          .then((value) async => await refresh())
          .whenComplete(() {
        Loader.loadComplete(context);
      });
    }
  }

  void search(String title, BuildContext context, {newPage = true}) async {
    _friendFilter = false;
    Loader.load(context);
    reGet = () => search(title, context, newPage: false);

    movieResponse = await MoviesService.searchMovies(
      GetMovieRequestFilters(
        movieLiked: MovieLiked.BOTH,
        movieSortBy: MovieSortBy.ALPHABETICALDESC,
        genres: [],
        friends: [],
        search: title,
      ),
    ).whenComplete(() {
      renderComplete(context, newPage);
    });
    filter(_text);
  }

  void getOwnMovies(BuildContext context, {newPage = true}) async {
    _friendFilter = false;
    Loader.load(context);
    reGet = () => getOwnMovies(context, newPage: false);

    movieResponse = await MoviesService.getOwnMovies().whenComplete(() {
      renderComplete(context, newPage);
    });
    filter(_text);
  }

  void getRecommendedMovies(BuildContext context, {newPage = true}) async {
    _friendFilter = true;
    Loader.load(context);
    reGet = () => getRecommendedMovies(context, newPage: false);

    movieResponse =
        await MoviesService.getRecommendedMovies(friends).whenComplete(() {
      renderComplete(context, newPage);
    });
    filter(_text);
  }

  void getPopularMovies(BuildContext context, {newPage = true}) async {
    _friendFilter = false;
    Loader.load(context);
    reGet = () => getPopularMovies(context, newPage: false);

    movieResponse = await MoviesService.getPopularMovies().whenComplete(() {
      renderComplete(context, newPage);
    });
    filter(_text);
  }

  void navigateToMovies(BuildContext context) {
    Navigator.of(context)
        // ignore: prefer_const_constructors
        .push(RouteAnimationService.createRoute(
            page: Movies(
              friendFilter: _friendFilter,
            ),
            offset: const Offset(0.0, 1.0),
            duration: const Duration(milliseconds: 1250)));
  }

  void renderComplete(BuildContext context, bool newPage) {
    notifyListeners();
    Loader.loadComplete(context);
    if (newPage) {
      _text = "";
      filter(_text);
      navigateToMovies(context);
    }
  }

  Future<bool> refresh() async {
    reGet();
    filter(_text);
    notifyListeners();
    return true;
  }
}
