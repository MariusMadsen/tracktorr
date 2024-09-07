import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContextSelector extends StatelessWidget {
  const ContextSelector(
      {super.key,
      required this.action,
      required this.actionName,
      required this.actionIcon});

  final Function action;
  final String actionName;
  final IconData actionIcon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              action();
            },
            child: Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(child: Icon(actionIcon)),
                  TextSpan(text: "    $actionName "),
                  const WidgetSpan(child: Icon(FontAwesomeIcons.chevronRight)),
                ],
              ),
            ),
          ),
          const Divider(
            endIndent: 45,
            indent: 45,
          )
        ],
      ),
    );
  }
}
