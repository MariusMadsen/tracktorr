import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/contracts/mtg_contracts.dart';
import 'package:laruina/provider/mtg_model.dart';
import 'package:laruina/statics/colors.dart';
import 'package:laruina/widgets/tile/tile_button.dart';
import 'package:provider/provider.dart';


class MagicCard extends StatelessWidget {
  const MagicCard({super.key, required this.card, required this.viewContext});

  final MtgCard card;
  final String viewContext;

  @override
  Widget build(BuildContext context) {
    String numCards = "${card.quantity} card";
    if (card.quantity != 1) {
      numCards += "s";
    }

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.accent(),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (card.quantity > 0)
                ItemTileButton(
                    icon: FontAwesomeIcons.minus,
                    enabled: false,
                    action: () {
                      context
                          .read<MtgModel>()
                          .remove(context, card, viewContext);
                    }),
              if (card.quantity == 0)
                Container(
                  width: 50,
                ),
              ItemTileButton(
                  icon: FontAwesomeIcons.plus,
                  enabled: true,
                  action: () {
                    context.read<MtgModel>().add(context, card, viewContext);
                  }),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              useSafeArea: true,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: EdgeInsets.zero,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.height / 2 * 0.741,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: card.img,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                decoration: BoxDecoration(
                  color: ThemeColors.backGround(),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.plus,
                        color: ThemeColors.accent(),
                      ),
                      title: Text(
                        "Add to deck",
                        style: TextStyle(color: ThemeColors.text()),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.passthrough,
            children: [
              CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: card.img,
                height: 250,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      color: ThemeColors.accent(),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  gradient: LinearGradient(
                    begin: FractionalOffset.center,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.transparent.withOpacity(0.0),
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: const [0.25, 1.0],
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 5,
                right: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#${card.collectorNumber} ${card.setId}",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(card.foil ? "Foiled" : "",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12)),
                    Text(
                      "${card.price}\$",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 5,
                right: 5,
                child: Text(
                  numCards,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
