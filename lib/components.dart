import 'package:flutter/material.dart';
import 'appcontroller.dart';
import 'data.dart';

class Dummy extends StatefulWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: ImageController.instance,
        builder: (context, child) {
          return Image.asset(ImageController.instance.image);
        });
  }
}

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

class WordPanel extends StatefulWidget {
  final String txt;
  const WordPanel({Key? key, required this.txt}) : super(key: key);

  @override
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

class Button extends StatefulWidget {
  final String txt;
  const Button({Key? key, required this.txt}) : super(key: key);

  @override
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
                    ? Colors.grey
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

class VerticalPadding extends StatelessWidget {
  final double height;
  const VerticalPadding({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
    );
  }
}

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
