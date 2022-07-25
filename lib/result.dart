import 'package:flutter/material.dart';
import 'appcontroller.dart';
import 'components.dart';
import 'data.dart';

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
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Results.instance.victory
              ? const Text("Você venceu!")
              : const Text("Você perdeu."),
          const VerticalPadding(height: 20),
          Text("Total de letras usadas: ${Results.instance.totalWords}."),
          const VerticalPadding(height: 20),
          Text("Total de letras corretas: ${Results.instance.correctWords}."),
          const VerticalPadding(height: 20),
          Text("Total de letras erradas: ${Results.instance.wrongWords}."),
          const VerticalPadding(height: 10),
          SizedBox(
            width: 100,
            // ignore: deprecated_member_use
            child: FlatButton(
                color: Colors.cyan,
                onPressed: () {
                  Results.instance.reset();
                  ImageController.instance.reset();
                  HintController.instance.reset();
                  PanelController.instance.reset();

                  Navigator.of(context).pushReplacementNamed("/");
                },
                child: const Center(child: Text("Reiniciar"))),
          ),
        ]));
  }
}
