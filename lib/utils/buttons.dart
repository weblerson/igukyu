import 'package:flutter/material.dart';

import 'package:jogo_da_forca/components/keyboard.dart';

class Buttons {
  String array1 = "ABCDEFG";
  String array2 = "HIJKLMN";
  String array3 = "OPQRSTU";
  String array4 = "VWXYZ";

  List<Widget> content = [];

  static var instance = Buttons();

  List<Widget> line(int i) {
    switch (i) {
      case 0:
        content = [];
        array1.split('').forEach((element) {
          content.add(Button(
            txt: element,
          ));
        });

        return content;

      case 1:
        content = [];
        array2.split('').forEach((element) {
          content.add(Button(
            txt: element,
          ));
        });

        return content;

      case 2:
        content = [];
        array3.split('').forEach((element) {
          content.add(Button(
            txt: element,
          ));
        });

        return content;

      case 3:
        content = [];
        array4.split('').forEach((element) {
          content.add(Button(
            txt: element,
          ));
        });

        return content;
    }

    return content;
  }
}
