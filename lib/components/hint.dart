import 'package:flutter/material.dart';

import 'package:jogo_da_forca/controller/hint.dart';

import 'package:jogo_da_forca/data/words.dart';

class Hint extends StatefulWidget {
  const Hint({Key? key}) : super(key: key);

  @override
  State<Hint> createState() => _HintState();
}

class _HintState extends State<Hint> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: HintController.instance,
        builder: (context, child) {
          return HintController.instance.remainsTwo
              ? Text("Dica: ${Words.instance.hint}")
              : const Text("");
        });
  }
}
