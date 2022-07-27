import 'package:flutter/material.dart';

import 'package:jogo_da_forca/controller/image.dart';

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
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                border: Border.all(width: 3.0, color: Colors.black)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                    fit: BoxFit.fill, ImageController.instance.image)),
          );
        });
  }
}
