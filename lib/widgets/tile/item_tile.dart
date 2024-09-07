import 'package:flutter/material.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/common/cover_card.dart';

class ItemTile extends StatelessWidget {
  const ItemTile(
      {super.key,
      required this.img,
      required this.tileInfo,
      required this.buttons,
      this.onTap,
      this.header});

  final String img;
  final Widget tileInfo;
  final List<Widget> buttons;
  final String? header;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        color: ThemeColors.transparent(),
        child: Stack(
          children: [
            if (header != null)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    header!.toUpperCase(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: tileInfo,
                      ),
                      CoverCard(img: img)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Divider(
                  endIndent: 30,
                  indent: 30,
                  color: ThemeColors.text(),
                ),
              ],
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 3 / 5,
              left: 0,
              bottom: 30,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: buttons,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
