import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laruina/provider/mtg_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/Scaffolder.dart';
import 'package:laruina/widgets/appbar/search_app_bar.dart';
import 'package:provider/provider.dart';

class MtgSetsPage extends StatefulWidget {
  const MtgSetsPage({super.key});

  @override
  State<MtgSetsPage> createState() => _MtgSetsPageState();
}

class _MtgSetsPageState extends State<MtgSetsPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffolder(
      appBar: SearchAppBar(
        controller: controller,
        searched: false,
        hintText: "Search among the results",
        onSearchSubmit: () {
          context.read<MtgModel>().filterSet(controller.text);
        },
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // Swiping in right direction.
          debugPrint(details.delta.dx.toString());
          if (details.delta.dx > 8) {
            Navigator.of(context).pop();
          }
        },
        child: SafeArea(child: Center(
          child: Consumer<MtgModel>(
            builder: (context, value, child) {
              value.filteredSets.sets.sort(
                (a, b) => a.setName.compareTo(b.setName),
              );
              return ListView(
                children: [
                  const Text(
                    "Magic the Gathering sets",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: value.filteredSets.sets
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () {
                                context
                                    .read<MtgModel>()
                                    .selectSet(context, e.setId);
                              },
                              textColor: ThemeColors.text(),
                              title: Text(
                                  "${e.setName.toUpperCase()} \n[${e.setId}]"),
                              trailing: SvgPicture.network(
                                e.setImg,
                                fit: BoxFit.contain,
                                colorFilter: ColorFilter.mode(
                                    ThemeColors.accent(), BlendMode.srcIn),
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              );
            },
          ),
        )),
      ),
    );
  }
}
