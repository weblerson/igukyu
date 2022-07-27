import 'package:flutter/material.dart';

import 'package:jogo_da_forca/controller/panel.dart';

import 'package:jogo_da_forca/data/words.dart';

class WordPanel extends StatefulWidget {
  final String txt;
  const WordPanel({Key? key, required this.txt}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<WordPanel> createState() => _WordPanelState(txt);
}

class _WordPanelState extends State<WordPanel> {
  final String txt;
  _WordPanelState(this.txt);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: PanelController.instance,
        builder: (context, child) {
          return Container(
            width: 20,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 3.0))),
            child: Center(
                child: PanelController.instance
                        .success[Words.instance.word.split('').indexOf(txt)]
                    ? Text(txt)
                    : const Text("")),
          );
        });
  }
}
