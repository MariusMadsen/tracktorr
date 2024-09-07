import 'package:flutter/material.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/provider/movie_person_model.dart';
import 'package:laruina/widgets/common/avatar.dart';
import 'package:provider/provider.dart';

class MovieCastList extends StatelessWidget {
  const MovieCastList({super.key, required this.detailedMovie});

  final DetailedMovie detailedMovie;

  String formatText(String text, bool newLine) {
    if (text.length < 15) {
      return text + (newLine ? "\n" : "");
    }

    return text.substring(0, 15) + (newLine ? "\n" : "");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: GridView(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: (MediaQuery.of(context).size.width - 20) / 2,
            crossAxisCount: 3,
            childAspectRatio:
                (MediaQuery.of(context).size.width - 20) / 2 / 50),
        shrinkWrap: true,
        clipBehavior: Clip.antiAlias,
        physics: const PageScrollPhysics(),
        padding: EdgeInsets.zero,
        // childAspectRatio: (MediaQuery.of(context).size.width - 20) / 2 / 50,
        children: detailedMovie.cast
            .map(
              (e) => GestureDetector(
                onTap: () {
                  context.read<MoviePersonModel>().get(e.id, context);
                },
                child: Container(
                  height: 25,
                  width: (MediaQuery.of(context).size.width - 20) / 2,
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      UserAvatar(
                        url: "https://image.tmdb.org/t/p/original/${e.img}",
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: formatText(e.name, true),
                            ),
                            TextSpan(
                              text: formatText(e.as, false),
                            )
                          ],
                        ),
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
