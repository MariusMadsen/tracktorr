import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laruina/statics/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Scaffolder extends StatefulWidget {
  const Scaffolder({super.key, this.appBar, required this.body});

  final PreferredSizeWidget? appBar;
  final Widget body;

  @override
  State<Scaffolder> createState() => _ScaffolderState();
}

class _ScaffolderState extends State<Scaffolder> {
  WebViewController _controller = WebViewController();

  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: widget.appBar,
        backgroundColor: ThemeColors.backGround(),
        body: widget.body,
      ),
      onPopInvoked: (didPop) => _goBack(context),
    );
  }

  Future<bool> _goBack(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Do you want to exit'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: const Text('Yes'),
                  ),
                ],
              ));
      return Future.value(true);
    }
  }
}
