import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/pages/movies/detailed_movie_page.dart';
import 'package:laruina/provider/movies_model.dart';
import 'package:laruina/services/loader.dart';
import 'package:laruina/services/movies_service.dart';
import 'package:laruina/services/route_animation_service.dart';
import 'package:provider/provider.dart';

class SingleMovieModel extends ChangeNotifier {
  List<DetailedMovie> detailedMovie = [];

  Future<void> watchMovie(
      DetailedMovie detailedMovie, bool liked, BuildContext context) async {
    Loader.load(context);
    await MoviesService.watchDetailedMovie(detailedMovie, liked)
        .then((value) async => await refresh(context))
        .whenComplete(() => Loader.loadComplete(context));
  }

  Future<void> like(DetailedMovie detailedMovie, BuildContext context) async {
    Loader.load(context);
    if (detailedMovie.liked) {
      await MoviesService.dislike(detailedMovie.id)
          .then((value) async => await refresh(context))
          .whenComplete(() => Loader.loadComplete(context));
    } else {
      await MoviesService.like(detailedMovie.id)
          .then((value) async => await refresh(context))
          .whenComplete(() => Loader.loadComplete(context));
    }
  }

  Future<void> own(DetailedMovie detailedMovie, BuildContext context) async {
    Loader.load(context);
    if (detailedMovie.owned) {
      await MoviesService.disownMovie(detailedMovie.id)
          .then((value) async => await refresh(context))
          .whenComplete(() => Loader.loadComplete(context));
    } else {
      await MoviesService.ownMovie(detailedMovie.id)
          .then((value) async => await refresh(context))
          .whenComplete(() => Loader.loadComplete(context));
    }
  }

  void get(String movieId, BuildContext context) async {
    Loader.load(context);
    await MoviesService.getById(movieId).then((value) {
      detailedMovie.add(value);
      return value;
    }).whenComplete(() {
      Loader.loadComplete(context);
      notifyListeners();
      push(context);
    });
  }

  void push(BuildContext context) async {
    debugPrint("creating pop callback");
    await Navigator.push(
      context,
      RouteAnimationService.createRoute(
        page: const DetailedMoviePage(),
      ),
    ).whenComplete(() async {
      detailedMovie.removeLast();
      if (detailedMovie.isNotEmpty) {
        debugPrint("callback Done");
        debugPrint("Popping last detailed movie ${detailedMovie.length}");
        await refresh(context);
        notifyListeners();
      }
    });
  }

  Future<bool> refresh(BuildContext context) async {
    await MoviesService.getById(detailedMovie.last.id).then((value) {
      detailedMovie.removeLast();
      detailedMovie.add(value);
      return value;
    }).whenComplete(() => context.read<MoviesModel>().refresh());
    notifyListeners();
    return true;
  }
}
