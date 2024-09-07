import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/event_contracts.dart';
import 'package:laruina/provider/single_movie_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/common/avatar.dart';
import 'package:laruina/widgets/tile/item_tile.dart';
import 'package:provider/provider.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key, required this.userEvent});

  final EventPair userEvent;

  @override
  Widget build(BuildContext context) {
    final cloudinary =
        CloudinaryPublic('ragingmmonkey', 'UPLOAD_PRESET', cache: false);

    IconData getIcon(String eventType) {
      if (eventType == "GAME") {
        return FontAwesomeIcons.gamepad;
      }
      if (eventType == "MOVIE") {
        return FontAwesomeIcons.film;
      }
      if (eventType == "COMIC") {
        return FontAwesomeIcons.mask;
      }
      return FontAwesomeIcons.question;
    }

    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                UserAvatar(
                  url: cloudinary
                      .getImage("profiles/${userEvent.friend.id}")
                      .url,
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: userEvent.events
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            context
                                .read<SingleMovieModel>()
                                .get(e.itemId!, context);
                          },
                          child: ItemTile(
                            buttons: const [],
                            tileInfo: Center(
                              child: Row(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(getIcon(e.eventType))),
                                  Expanded(child: Text(e.message)),
                                ],
                              ),
                            ),
                            img: e.img!,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
