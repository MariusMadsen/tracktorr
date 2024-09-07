import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/comics_contracts.dart';
import 'package:laruina/statics/colors.dart';

class DetailedComicIssues extends StatelessWidget {
  const DetailedComicIssues({super.key, required this.issues});

  final List<DetailedIssue> issues;

  List<List<DetailedIssue>> toPartitonedLists() {
    List<List<DetailedIssue>> chunks = [];
    int chunkSize = 50;
    for (var i = 0; i < issues.length; i += chunkSize) {
      chunks.add(issues.sublist(
          i, i + chunkSize > issues.length ? issues.length : i + chunkSize));
    }
    return chunks;
  }

  List<ListTile> toListOfListTiles(List<DetailedIssue> issues) {
    return issues
        .map(
          (e) => ListTile(
            title: Text(
              e.volumeName,
              style: TextStyle(color: ThemeColors.text()),
            ),
            subtitle: Text(
              "#${e.issue} ${e.name}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ThemeColors.text()),
            ),
            leading: Image.network(e.img),
            trailing: FaIcon(FontAwesomeIcons.eye,
                color: e.read ? ThemeColors.yes() : ThemeColors.text()),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: toPartitonedLists()
          .map(
            (e) => Column(
              children: [
                ExpansionTile(
                  leading: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text:
                                "${e.where((element) => element.read).length} "),
                        WidgetSpan(
                            child: FaIcon(
                          FontAwesomeIcons.eye,
                          color: e.any((element) => !element.read)
                              ? ThemeColors.text()
                              : ThemeColors.yes(),
                        ))
                      ],
                      style: TextStyle(
                          fontSize: 16,
                          color: e.any((element) => !element.read)
                              ? ThemeColors.text()
                              : ThemeColors.yes()),
                    ),
                  ),
                  title: Text(
                    "${e.first.volumeName} #${e.first.issue} - ${e.last.volumeName} #${e.last.issue}",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12,
                      color: ThemeColors.text(),
                    ),
                  ),
                  trailing: FaIcon(
                    FontAwesomeIcons.caretDown,
                    color: ThemeColors.text(),
                  ),
                  tilePadding: const EdgeInsets.only(
                      bottom: 15, left: 10, right: 10, top: 10),
                  children: toListOfListTiles(e),
                ),
                const Divider(
                  endIndent: 15,
                  indent: 15,
                )
              ],
            ),
          )
          .toList(),
    );
  }
}
