import 'package:flutter/material.dart';

import 'package:jogo_da_forca/components/padding.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(color: const Color(0xff3232a8)),
        Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 3.0),
              borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Jogo da Forca",
                  style:
                      TextStyle(fontSize: 52.0, fontWeight: FontWeight.bold)),
              const VerticalPadding(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset('assets/images/6.png', fit: BoxFit.fill),
              ),
              const VerticalPadding(height: 10),
              // ignore: deprecated_member_use
              FlatButton(
                  minWidth: 200,
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/');
                  },
                  child: const Text("Jogar"))
            ],
          ),
        )
      ],
    ));
  }
}
