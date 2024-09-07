import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/pages/common/friend_selector.dart';
import 'package:laruina/services/route_animation_service.dart';
import 'package:laruina/statics/colors.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar(
      {super.key,
      required this.searched,
      required this.controller,
      required this.hintText,
      this.friendFilter = false,
      this.onSearchSubmit});

  final bool searched;
  final TextEditingController controller;
  final String hintText;
  final bool friendFilter;
  final Function? onSearchSubmit;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: Theme.of(context).iconTheme,
      actions: [
        if (friendFilter)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    // ignore: prefer_const_constructors
                    .push(RouteAnimationService.createRoute(
                        page: const FriendSelector(),
                        offset: const Offset(0.0, 1.0),
                        duration: const Duration(milliseconds: 1250)));
              },
              child: const Icon(
                FontAwesomeIcons.userGroup,
              ),
            ),
          )
      ],
      backgroundColor: Colors.transparent,
      title: TextField(
        autofocus: false,
        style: TextStyle(
          color: ThemeColors.text(),
        ),
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              controller.clear();
              if (onSearchSubmit != null) {
                onSearchSubmit!();
              }
            },
            child: Icon(
              FontAwesomeIcons.x,
              color: ThemeColors.accent(),
            ),
          ),
          prefixIcon: GestureDetector(
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: ThemeColors.accent(),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        autocorrect: false,
        onSubmitted: (value) {
          if (onSearchSubmit != null) {
            onSearchSubmit!();
          }
        },
      ),
    );
  }
}
