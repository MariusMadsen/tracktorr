import 'package:flutter/material.dart';
import 'package:laruina/contracts/comics_contracts.dart';

class ComicTileInfo extends StatelessWidget {
  const ComicTileInfo({super.key, required this.volume});

  final ComicVolume volume;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(volume.title),
          if (volume.nextIssueToRead != null)
            Text.rich(
              TextSpan(
                text: "#${volume.nextIssueToRead!.issue} | ",
                children: [
                  TextSpan(
                    text: "${volume.percentRead}%",
                    style: const TextStyle(fontSize: 10, color: Colors.white54),
                  ),
                ],
              ),
            ),
          if (volume.nextIssueToRead != null)
            Text(volume.nextIssueToRead!.name, style: const TextStyle(fontSize: 14))
        ],
      ),
    );
  }
}
