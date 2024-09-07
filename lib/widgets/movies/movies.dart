import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/provider/movies_model.dart';
import 'package:laruina/provider/single_movie_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/appbar/search_app_bar.dart';
import 'package:laruina/widgets/movies/movie_tile_info.dart';
import 'package:laruina/widgets/movies/watch_movie_dialog.dart';
import 'package:laruina/widgets/tile/item_tile.dart';
import 'package:laruina/widgets/tile/tile_button.dart';
import 'package:provider/provider.dart';

class Movies extends StatefulWidget {
  const Movies({super.key, this.friendFilter = false});

  final bool friendFilter;

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  final TextEditingController controller = TextEditingController();

  bool searched = false;

  @override
  Widget build(BuildContext context) {
    controller.addListener(
      () {
        setState(() {
          searched = controller.text.isNotEmpty;
        });
        context.read<MoviesModel>().filter(controller.text);
      },
    );
    return Scaffold(
      appBar: SearchAppBar(
        controller: controller,
        searched: searched,
        hintText: "Search among the results",
        friendFilter: widget.friendFilter,
      ),
      backgroundColor: ThemeColors.backGround(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Consumer<MoviesModel>(
            builder: (context, value, child) {
              if (value.filteredResult == null) {
                return Container();
              }

              debugPrint(value.filteredResult.toString());
              return ListView(
                children: value.filteredResult!.movies
                    .map((e) => ItemTile(
                        onTap: () =>
                            context.read<SingleMovieModel>().get(e.id, context),
                        buttons: [
                          ItemTileButton(
                              icon: FontAwesomeIcons.eye,
                              enabled: e.watched,
                              action: () async {
                                if (!e.watched) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => WatchMovieDialog(
                                      movie: e,
                                    ),
                                  );
                                }
                              }),
                          if (e.watched)
                            ItemTileButton(
                                icon: FontAwesomeIcons.thumbsUp,
                                enabled: e.liked,
                                action: () async {
                                  context.read<MoviesModel>().like(e, context);
                                }),
                          ItemTileButton(
                              icon: FontAwesomeIcons.crown,
                              enabled: e.owned,
                              action: () async {
                                await context
                                    .read<MoviesModel>()
                                    .own(e, context);
                              })
                        ],
                        img: "https://image.tmdb.org/t/p/original/${e.img!}",
                        tileInfo: MovieTileInfo(
                          movie: e,
                        )))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
