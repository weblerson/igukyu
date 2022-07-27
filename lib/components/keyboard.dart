import 'package:flutter/material.dart';

import 'package:jogo_da_forca/controller/image.dart';
import 'package:jogo_da_forca/controller/button.dart';
import 'package:jogo_da_forca/controller/hint.dart';
import 'package:jogo_da_forca/controller/panel.dart';

import 'package:jogo_da_forca/utils/buttons.dart';

import 'package:jogo_da_forca/data/results.dart';
import 'package:jogo_da_forca/data/words.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Buttons.instance.line(0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Buttons.instance.line(1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Buttons.instance.line(2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Buttons.instance.line(3),
        )
      ],
    );
  }
}

class Button extends StatefulWidget {
  final String txt;
  const Button({Key? key, required this.txt}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Button> createState() => _ButtonState(txt);
}

class _ButtonState extends State<Button> {
  final String txt;
  _ButtonState(this.txt);

  @override
  Widget build(BuildContext context) {
    var controller = ButtonController(txt);

    // ignore: deprecated_member_use
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.all(2),
          child: SizedBox(
              width: 50,
              // ignore: deprecated_member_use
              child: FlatButton(
                color: controller.error == null
                    ? Colors.white
                    : controller.error == false
                        ? Colors.green
                        : Colors.red,
                child: Text(txt),
                onPressed: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  controller.disabled ? null : controller.testLetter();
                  HintController.instance.testErrors();
                  PanelController.instance.testWord(txt);

                  Results.instance.totalWords++;

                  if (Words.instance.word.contains(txt)) {
                    Results.instance.correctWords++;
                  } else {
                    Results.instance.wrongWords++;
                  }

                  if (ImageController.instance.errors == 6) {
                    Results.instance.victory = false;
                    Navigator.of(context).pushReplacementNamed("/result");
                  }

                  if (!PanelController.instance.success
                      .any((element) => !element)) {
                    Results.instance.victory = true;
                    Navigator.of(context).pushReplacementNamed("/result");
                  }

                  final snackBar = SnackBar(
                      content: Words.instance.word.split('').contains(txt)
                          ? const Text("Letra correta!")
                          : const Text("Letra errada."));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              )),
        );
      },
    );
  }
}
