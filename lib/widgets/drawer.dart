import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/pages/comic/comic_page.dart';
import 'package:laruina/pages/games/games_page.dart';
import 'package:laruina/pages/movies/movies_page.dart';
import 'package:laruina/pages/mtg/mtg_page.dart';
import 'package:laruina/services/auth_service.dart';
import 'package:laruina/services/mtg_service.dart';
import 'package:laruina/services/route_animation_service.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/drawer/drawer_button.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: ThemeColors.backGround(),
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Center(
                  child: Text(
                    "T R A C K T O R",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            DrawerTile(
                icon: FontAwesomeIcons.film,
                text: "Movies",
                onTap: () {
                  Navigator.of(context)
                      // ignore: prefer_const_constructors
                      .push(
                          RouteAnimationService.createRoute(page: MoviePage()));
                }),
            DrawerTile(
                icon: FontAwesomeIcons.mask,
                text: "Comics",
                onTap: () {
                  Navigator.of(context)
                      // ignore: prefer_const_constructors
                      .push(RouteAnimationService.createRoute(
                          page: ComicsPage()));
                }),
            DrawerTile(
                onTap: () {
                  Navigator.of(context)
                      // ignore: prefer_const_constructors
                      .push(
                          RouteAnimationService.createRoute(page: GamesPage()));
                },
                icon: FontAwesomeIcons.gamepad,
                text: "Games"),
            DrawerTile(
                onTap: () {
                  Navigator.of(context).push(
                    RouteAnimationService.createRoute(
                      page: MtgPage(),
                    ),
                  );
                },
                icon: FontAwesomeIcons.shield,
                text: "MTG"),
            DrawerTile(
              onTap: () => AuthService.logout(),
              icon: FontAwesomeIcons.arrowRightFromBracket,
              text: "Sign out",
            ),
            DrawerTile(
                onTap: () => MtgService.migrate(),
                icon: FontAwesomeIcons.database,
                text: "Migrate")
          ],
        ),
      ),
    );
  }
}
