import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/provider/comics_provider.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/common/context_selector.dart';
import 'package:laruina/widgets/common/search_content.dart';
import 'package:provider/provider.dart';

class ComicsPage extends StatelessWidget {
  ComicsPage({super.key});

  final TextEditingController searchMovieController = TextEditingController();

  void search(ComicsModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    model.search(searchMovieController.text, context);
  }

  void getOrder(ComicsModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    model.getOrder(context);
  }

  void getOwnComics(ComicsModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    model.getOwnOngoingComics(context);
  }

  void getOwnUnstartedComics(ComicsModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    model.getOwnUnstartedComics(context);
  }

  void getOwnFinishedComics(ComicsModel model, BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    model.getOwnFinishedComics(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backGround(),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 225,
              ),
              SearchContent(
                searchController: searchMovieController,
                search: () => search(context.read<ComicsModel>(), context),
                hintText: "Search for any comic",
              ),
              const SizedBox(
                height: 30,
              ),
              ContextSelector(
                  action: () =>
                      getOwnComics(context.read<ComicsModel>(), context),
                  actionName: "See comic backlog",
                  actionIcon: FontAwesomeIcons.eye),
              ContextSelector(
                  action: () => getOwnFinishedComics(
                      context.read<ComicsModel>(), context),
                  actionName: "See finished comics",
                  actionIcon: FontAwesomeIcons.check),
              ContextSelector(
                  action: () => getOwnUnstartedComics(
                      context.read<ComicsModel>(), context),
                  actionName: "See unstarted comics",
                  actionIcon: FontAwesomeIcons.bookmark),
              ContextSelector(
                  action: () => getOrder(context.read<ComicsModel>(), context),
                  actionName: "See comic orders",
                  actionIcon: FontAwesomeIcons.listUl),
            ],
          ),
        ),
      ),
    );
  }
}
