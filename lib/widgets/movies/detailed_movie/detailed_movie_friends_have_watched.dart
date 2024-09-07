import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/widgets/movies/detailed_movie/detailed_movie_padding.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/common/avatar.dart';

class DetailedMovieFriendsHaveWatched extends StatelessWidget {
  DetailedMovieFriendsHaveWatched({super.key, required this.detailedMovie});

  final DetailedMovie detailedMovie;
  final cloudinary =
      CloudinaryPublic('ragingmmonkey', 'UPLOAD_PRESET', cache: false);

  @override
  Widget build(BuildContext context) {
    return DetailedMoviePadding(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Text(
            "Your friends have watched it too",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 75,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: detailedMovie.friendsWhoHaveWatched
                  .map(
                    (e) => Stack(
                      children: [
                        UserAvatar(
                          size: 30,
                          url: cloudinary.getImage("profiles/${e.id}").url,
                        ),
                        Positioned(
                          bottom: 15,
                          right: 5,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: ThemeColors.bottomNavbar(),
                            ),
                            child: FaIcon(
                              e.liked
                                  ? FontAwesomeIcons.thumbsUp
                                  : FontAwesomeIcons.thumbsDown,
                              size: 15,
                              color: e.liked
                                  ? ThemeColors.yes()
                                  : ThemeColors.accent(),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
