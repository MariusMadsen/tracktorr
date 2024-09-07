import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';
import 'package:laruina/services/movies_service.dart';
import 'package:laruina/widgets/common/cover_card.dart';

class MoviePersonHeader extends StatelessWidget {
  const MoviePersonHeader({super.key, required this.moviePerson});

  final MoviePerson moviePerson;

  String getDateString(String? date) {
    if (date == null) {
      return "?";
    }
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);

    var outputFormat = DateFormat('dd MMMM yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return DetailedMoviePadding(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        moviePerson.name,
                        style: const TextStyle(fontSize: 26),
                      ),
                      Text.rich(TextSpan(children: [
                        const WidgetSpan(child: Icon(FontAwesomeIcons.baby)),
                        TextSpan(
                            text: " ${getDateString(moviePerson.birthday)}")
                      ])),
                      Text.rich(TextSpan(children: [
                        const WidgetSpan(child: Icon(FontAwesomeIcons.skull)),
                        TextSpan(text: " ${getDateString(moviePerson.death)}")
                      ]))
                    ],
                  ),
                  CoverCard(
                    img: MoviesService.buildImgUrl(moviePerson.img),
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
    );
  }
}
