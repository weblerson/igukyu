import 'package:flutter/material.dart';

import 'package:jogo_da_forca/controller/panel.dart';

import 'package:jogo_da_forca/components/padding.dart';
import 'package:jogo_da_forca/components/dummy.dart';
import 'package:jogo_da_forca/components/wordpanel.dart';
import 'package:jogo_da_forca/components/hint.dart';
import 'package:jogo_da_forca/components/keyboard.dart';

import 'package:jogo_da_forca/data/words.dart';

import 'package:jogo_da_forca/utils/panel.dart';

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
        body: Stack(
          children: [
            Container(
              color: const Color(0xff3232a8),
              width: double.infinity,
              height: double.infinity,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Flexible(child: Dummy()),
              const VerticalPadding(height: 20),
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: Panels.instance.list,
                  )),
              const VerticalPadding(height: 20),
              const Hint(),
              const VerticalPadding(height: 10),
              const Keyboard(),
              const VerticalPadding(height: 10),
              const Text(
                "PROG 4",
                style: TextStyle(fontSize: 22.0),
              )
            ])
          ],
        ));
  }
}
