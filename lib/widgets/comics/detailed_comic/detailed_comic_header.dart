import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/comics_contracts.dart';
import 'package:laruina/widgets/common/cover_card.dart';

class DetailedComicHeader extends StatelessWidget {
  const DetailedComicHeader({super.key, required this.comicVolume});

  final DetailedVolume comicVolume;

  @override
  Widget build(BuildContext context) {
    String backdropImg =
        comicVolume.img.replaceAll(RegExp("original"), "screen_medium");
    return Stack(
      children: [
        Column(
          children: [
            Container(
              decoration: backdropImg == null
                  ? null
                  : BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            backdropImg!,
                          ),
                          fit: BoxFit.fill),
                    ),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
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
                                      comicVolume.name,
                                      style: const TextStyle(fontSize: 26),
                                    ),
                                    Text.rich(TextSpan(children: [
                                      const WidgetSpan(
                                          child:
                                              Icon(FontAwesomeIcons.calendar)),
                                      TextSpan(text: comicVolume.year)
                                    ])),
                                    Text.rich(TextSpan(children: [
                                      const WidgetSpan(
                                          child: Icon(
                                              FontAwesomeIcons.sheetPlastic)),
                                      TextSpan(
                                          text:
                                              "${comicVolume.numIssues} issues")
                                    ]))
                                  ],
                                ),
                              ),
                              CoverCard(
                                img: comicVolume.img,
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
        //DetailedMovieUserInfo(detailedMovie: detailedMovie)
      ],
    );
  }
}
