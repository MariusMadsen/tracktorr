import 'package:flutter/material.dart';
import 'package:laruina/widgets/events/events.dart';
import 'package:laruina/widgets/scaffold.dart';
import 'package:laruina/widgets/statistics/stats.dart';

class HubPage extends StatefulWidget {
  const HubPage({super.key});

  @override
  State<HubPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HubPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffolding(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            Container(
              padding: const EdgeInsets.only(top: 25, bottom: 45),
              child: const Text(
                "Welcone back stranger",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.white),
              ),
            ),
            const Activities(),
            const Stats(),
          ],
        ),
      ),
    );
  }
}
