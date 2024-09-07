import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/provider/statistic_provider.dart';
import 'package:laruina/widgets/statistics/stat.dart';
import 'package:laruina/widgets/statistics/statisticeline.dart';
import 'package:provider/provider.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  Stat getStat(UserStats stats, StatisticType type, IconData icon) {
    return stats.statistics
        .where((element) => element.statType == type)
        .map((e) => Stat(score: e.amount, icon: icon))
        .first;
  }

  @override
  Widget build(BuildContext context) {
    final stats = context.read<StatisticModel>();
    stats.get();

    return Consumer<StatisticModel>(builder: (context, value, child) {
      return value.stats == null
          ? Container()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text.rich(
                    TextSpan(
                      text: "STATISTICS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                StatisticLine(title: "GAMES", stat: [
                  getStat(value.stats!, StatisticType.TOTALGAMES,
                      FontAwesomeIcons.crown),
                  getStat(value.stats!, StatisticType.GAMESCOMPLETED,
                      FontAwesomeIcons.check),
                ]),
                StatisticLine(title: "MOVIES", stat: [
                  getStat(value.stats!, StatisticType.MOVIESWATCHED,
                      FontAwesomeIcons.eye),
                ]),
                StatisticLine(title: "COMICS", stat: [
                  getStat(value.stats!, StatisticType.COMICVOLUMES,
                      FontAwesomeIcons.crown),
                  getStat(value.stats!, StatisticType.COMICISSUES,
                      FontAwesomeIcons.eye),
                ]),
                const Divider()
              ],
            );
    });
  }
}
