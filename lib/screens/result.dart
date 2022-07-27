import 'package:flutter/material.dart';

import 'package:jogo_da_forca/components/padding.dart';

import 'package:jogo_da_forca/utils/game.dart';

import 'package:jogo_da_forca/data/results.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Resultados")),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                color: const Color(0xff3232a8),
                width: double.infinity,
                height: double.infinity),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3.0, color: Colors.black)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Results.instance.victory
                        ? const Text("Você venceu!",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold))
                        : const Text("Você perdeu",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                    const VerticalPadding(height: 20),
                    Text(
                        "Total de letras usadas: ${Results.instance.totalWords}."),
                    const VerticalPadding(height: 20),
                    Text(
                        "Total de letras corretas: ${Results.instance.correctWords}."),
                    const VerticalPadding(height: 20),
                    Text(
                        "Total de letras erradas: ${Results.instance.wrongWords}."),
                    const VerticalPadding(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                            minWidth: 100,
                            color: Colors.cyan,
                            onPressed: () {
                              Game.reset();

                              Navigator.of(context).pushReplacementNamed("/");
                            },
                            child: const Center(child: Text("Reiniciar"))),
                        const HorizontalPadding(width: 10),
                        // ignore: deprecated_member_use
                        FlatButton(
                            minWidth: 100,
                            color: Colors.cyan,
                            onPressed: () {
                              Game.reset();

                              Navigator.of(context)
                                  .pushReplacementNamed('/menu');
                            },
                            child: const Text("Menu Principal"))
                      ],
                    ),
                  ]),
            )
          ],
        ));
  }
}
