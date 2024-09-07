import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/services/movies_service.dart';
import 'package:laruina/widgets/common/cover_card.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_user_info.dart';

class DetailedMovieHeader extends StatelessWidget {
  const DetailedMovieHeader({super.key, required this.detailedMovie});

  final DetailedMovie detailedMovie;

  String getDateString(DetailedMovie movie) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(movie.releaseDate);

    var outputFormat = DateFormat('dd MMMM yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }

  String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    String res = "";
    if (hour > 0) {
      res += "${hour}t ";
    }
    if (minutes > 0) {
      res += "${minutes}m";
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              decoration: detailedMovie.backdropImg == null
                  ? null
                  : BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            MoviesService.buildImgUrl(
                                detailedMovie.backdropImg),
                          ),
                          fit: BoxFit.fill),
                    ),
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.black.withOpacity(0.5)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      detailedMovie.title,
                                      style: const TextStyle(fontSize: 26),
                                    ),
                                    Text.rich(TextSpan(children: [
                                      const WidgetSpan(
                                          child:
                                              Icon(FontAwesomeIcons.calendar)),
                                      TextSpan(
                                          text:
                                              " ${getDateString(detailedMovie)}")
                                    ])),
                                    Text.rich(TextSpan(children: [
                                      const WidgetSpan(
                                          child:
                                              Icon(FontAwesomeIcons.hourglass)),
                                      TextSpan(
                                          text:
                                              " ${getTimeString(detailedMovie.runtime)}")
                                    ]))
                                  ],
                                ),
                              ),
                              CoverCard(
                                img:
                                    "https://image.tmdb.org/t/p/original/${detailedMovie.img}",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        DetailedMovieUserInfo(detailedMovie: detailedMovie)
      ],
    );
  }
}
