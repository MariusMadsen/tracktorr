import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/comics_contracts.dart';
import 'package:laruina/provider/comics_provider.dart';
import 'package:laruina/provider/single_comic_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/appbar/search_app_bar.dart';
import 'package:laruina/widgets/comics/comic_tile_info.dart';
import 'package:laruina/widgets/tile/item_tile.dart';
import 'package:laruina/widgets/tile/tile_button.dart';
import 'package:provider/provider.dart';

class Comics extends StatefulWidget {
  const Comics({super.key, required this.orderView});

  final bool orderView;
  @override
  State<Comics> createState() => _ComicsState();
}

class _ComicsState extends State<Comics> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.addListener(
      () {
        setState(() {
          //searched = controller.text.isNotEmpty;
        });
        context.read<ComicsModel>().filter(controller.text);
      },
    );
    return Scaffold(
      appBar: SearchAppBar(
        controller: controller,
        searched: false,
        hintText: "Search among the results",
      ),
      backgroundColor: ThemeColors.backGround(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Consumer<ComicsModel>(
              builder: (context, value, child) {
                debugPrint("I HAVE THIS ${value.filteredResult}");
                if (value.filteredResult.isEmpty) {
                  return Container();
                }
                List<ComicVolume> comics = value.filteredResult;
                comics.sort(
                  (a, b) {
                    if (a.order != null) {
                      return a.order!.compareTo(b.order!);
                    }
                    return a.title.compareTo(b.title);
                  },
                );
                debugPrint(comics.toString());
                return ListView(
                  children: comics
                      .map(
                        (e) => ItemTile(
                          onTap: () =>
                              context.read<SingleComicModel>().get(e, context),
                          header: e.order,
                          buttons: [
                            if (e.following)
                              ItemTileButton(
                                  icon: FontAwesomeIcons.eye,
                                  action: () {
                                    context
                                        .read<ComicsModel>()
                                        .read(e, context);
                                  }),
                            if (e.following && !widget.orderView)
                              ItemTileButton(
                                  icon: FontAwesomeIcons.check,
                                  action: () {
                                    context
                                        .read<ComicsModel>()
                                        .readAll(e, context);
                                  }),
                            if (!widget.orderView)
                              ItemTileButton(
                                  icon: FontAwesomeIcons.crown,
                                  enabled: e.following,
                                  action: () {
                                    context
                                        .read<ComicsModel>()
                                        .follow(e, context);
                                  })
                          ],
                          img: e.nextIssueToRead != null
                              ? e.nextIssueToRead!.imageUrl
                              : e.imageUrl,
                          tileInfo: ComicTileInfo(
                            volume: e,
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
