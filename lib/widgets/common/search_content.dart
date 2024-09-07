import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/statics/colors.dart';

class SearchContent extends StatelessWidget {
  const SearchContent(
      {super.key,
      required this.searchController,
      required this.search,
      required this.hintText});

  final TextEditingController searchController;
  final Function search;
  final String hintText;

  void clear() {
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ThemeColors.accent(),
      style: TextStyle(
        color: ThemeColors.text(),
        fontSize: 28,
      ),
      controller: searchController,
      decoration: InputDecoration(
        prefixIcon: GestureDetector(
          onTap: () {
            search();
          },
          child: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: ThemeColors.accent(),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            clear();
          },
          child: Icon(
            FontAwesomeIcons.x,
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
          fontSize: 28,
        ),
      ),
      autocorrect: false,
      onSubmitted: (value) {
        search();
      },
    );
  }
}
