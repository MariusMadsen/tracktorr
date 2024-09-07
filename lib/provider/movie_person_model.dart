import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/pages/movies/movie_person_page.dart';
import 'package:laruina/services/loader.dart';
import 'package:laruina/services/movies_service.dart';
import 'package:laruina/services/route_animation_service.dart';

class MoviePersonModel extends ChangeNotifier {
  List<MoviePerson> moviePersons = [];

  void get(String personId, BuildContext context) async {
    Loader.load(context);

    await MoviesService.getByPersonId(personId).then((value) {
      moviePersons.add(value);
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
        page: const MoviePersonPage(),
      ),
    );

    debugPrint("callback Done");
    debugPrint("Popping last detailed movie ${moviePersons.length}");
    moviePersons.removeLast();
    if (moviePersons.isNotEmpty) {
      await MoviesService.getByPersonId(moviePersons.last.id).then((value) {
        moviePersons.removeLast();
        moviePersons.add(value);
        return value;
      });
      notifyListeners();
    }
  }
}
