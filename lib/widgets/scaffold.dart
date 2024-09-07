import 'package:flutter/material.dart';
import 'package:laruina/widgets/drawer.dart';
import 'package:laruina/widgets/appbar/hub_appbar.dart';

class Scaffolding extends StatelessWidget {
  const Scaffolding({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: const HubAppBar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: body
    );
  }
}
