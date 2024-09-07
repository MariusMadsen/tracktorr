import 'package:flutter/material.dart';
import 'package:laruina/contracts/comics_contracts.dart';
import 'package:laruina/provider/single_comic_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/comics/detailed_comic/detailed_comic_header.dart';
import 'package:laruina/widgets/comics/detailed_comic/detailed_comic_issues.dart';
import 'package:laruina/widgets/comics/detailed_comic/detailed_comic_publisher.dart';
import 'package:provider/provider.dart';

class DetailedComicPage extends StatelessWidget {
  const DetailedComicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: SafeArea(child: Center(
        child: Consumer<SingleComicModel>(builder: (context, value, child) {
          if (value.comicVolume.isEmpty) {
            return Container();
          }
          final DetailedVolume comicVolume = value.comicVolume.last;
          return ListView(children: [
            DetailedComicHeader(
              comicVolume: comicVolume,
            ),
            DetailedComicPublisher(comicVolume: comicVolume),
            DetailedComicIssues(issues: comicVolume.issues)
          ]);
        }),
      )),
    );
  }
}
