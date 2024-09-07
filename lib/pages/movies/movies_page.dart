import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/provider/movies_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/common/search_content.dart';
import 'package:laruina/widgets/common/context_selector.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  MoviePage({super.key});

  final TextEditingController searchMovieController = TextEditingController();

  void search(MoviesModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    model.search(searchMovieController.text, context);
  }

  void getOwnMovies(MoviesModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    model.getOwnMovies(context);
  }

  void getRecommendedMovies(MoviesModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    model.getRecommendedMovies(context);
  }

  void getPopularMovies(MoviesModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    model.getPopularMovies(context);
  }

  void clear(MoviesModel model) {
    searchMovieController.clear();
    model.clear();
  }

  @override
  Widget build(BuildContext context) {
    final moviesModel = context.read<MoviesModel>();

    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 225,
              ),
              SearchContent(
                searchController: searchMovieController,
                search: () => search(moviesModel, context),
                hintText: "Search for any movie",
              ),
              const SizedBox(
                height: 30,
              ),
              ContextSelector(
                action: () => getOwnMovies(moviesModel, context),
                actionName: "See your own movies",
                actionIcon: FontAwesomeIcons.eye,
              ),
              ContextSelector(
                action: () => getRecommendedMovies(moviesModel, context),
                actionName: "See your recommended movies",
                actionIcon: FontAwesomeIcons.lightbulb,
              ),
              ContextSelector(
                action: () => getPopularMovies(moviesModel, context),
                actionName: "See whats popular",
                actionIcon: FontAwesomeIcons.fire,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
