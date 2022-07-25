import 'package:flutter/material.dart';
import 'appcontroller.dart';
import 'components.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Panels.instance.clear();
    Words.instance.setWord();

    Words.instance.word.split('').forEach((element) {
      Panels.instance.list.add(Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: WordPanel(txt: element)));

      PanelController.instance.success.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Jogo da Forca")),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Dummy(),
          const VerticalPadding(height: 100),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: Panels.instance.list,
              )),
          const VerticalPadding(height: 50),
          const Hint(),
          const VerticalPadding(height: 10),
          const Keyboard(),
          const VerticalPadding(height: 10),
          const Text(
            "PROG 4",
            style: TextStyle(fontSize: 22.0),
          )
        ]));
  }
}
