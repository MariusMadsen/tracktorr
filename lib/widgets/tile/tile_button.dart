import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laruina/statics/colors.dart';

class ItemTileButton extends StatefulWidget {
  const ItemTileButton(
      {super.key,
      required this.icon,
      required this.action,
      this.enabled = false});

  final IconData icon;
  final Function action;
  final bool enabled;

  @override
  State<ItemTileButton> createState() => _ItemTileButtonState();
}

class _ItemTileButtonState extends State<ItemTileButton>
    with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      border:
          Border.all(color: Colors.black, width: 1, style: BorderStyle.solid),
      boxShadow: const [
        BoxShadow(
            color: Color.fromARGB(161, 0, 0, 0),
            offset: Offset(0, 3),
            blurRadius: 2.0)
      ],
      borderRadius: BorderRadius.circular(12.0),
      color: ThemeColors.backGround(),
    ),
    end: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: ThemeColors.backGround(),
    ),
  );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 10),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      decoration: decorationTween.animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn)),
      child: SizedBox(
        width: 50,
        height: 30,
        child: Material(
          borderRadius: BorderRadius.circular(12.0),
          color: ThemeColors.backGround(),
          child: GestureDetector(
            onTap: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              _controller.forward();
              await widget.action();
              _controller.reverse();
            },
            onLongPress: () async {
              FocusManager.instance.primaryFocus?.unfocus();

              _controller.forward();
              await widget.action();
              _controller.reverse();
            },
            child: Center(
              child: FaIcon(
                widget.icon,
                color: widget.enabled
                    ? ThemeColors.accent()
                    : ThemeColors.harmonyOne(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
