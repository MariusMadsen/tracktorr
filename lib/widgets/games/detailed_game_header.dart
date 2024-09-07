import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/games_contracts.dart';
import 'package:laruina/services/games_service.dart';
import 'package:laruina/widgets/common/cover_card.dart';
import 'package:laruina/widgets/games/detailed_game_user_info.dart';

class DetailedGameHeader extends StatelessWidget {
  const DetailedGameHeader({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      GamesService.buildBanner(
                        game.cover ?? "",
                      ),
                    ),
                    fit: BoxFit.fill),
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      game.name,
                                      style: const TextStyle(fontSize: 26),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const WidgetSpan(
                                              child: Icon(
                                                  FontAwesomeIcons.calendar)),
                                          TextSpan(
                                              text: " ${game.releasedDate}")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              CoverCard(
                                img: GamesService.buildBanner(
                                  game.cover ?? "",
                                ),
                              )
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
          ],
        ),
        DetailedGameUserInfo(game: game)
      ],
    );
  }
}
