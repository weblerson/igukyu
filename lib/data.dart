import 'package:flutter/material.dart';
import 'components.dart';
import 'dart:math';

class Panels {
  List<Widget> list = [];
  static var instance = Panels();

  void clear() {
    list = [];

    return;
  }
}

class Words {
  List<Map<String, dynamic>> content = [
    {"w1": "CARRO", "w2": "MOTO", "hint": "AUTOMÓVEL"},
    {"w1": "VESTIDO", "w2": "CAMISA", "hint": "VESTUÁRIO"},
    {"w1": "MARTELO", "w2": "SERRA", "hint": "FERRAMENTA"},
    {"w1": "MICROONDAS", "w2": "FOGAO", "hint": "ELETRODOMÉSTICO"},
    {"w1": "CEBOLA", "w2": "PIMENTAO", "hint": "VERDURA"}
  ];

  String word = "";
  String hint = "";

  static var instance = Words();

  void setWord() {
    int listChoice = Random().nextInt(5);
    Map<String, dynamic> words = content[listChoice];

    int wordChoice = Random().nextInt(2);
    switch (wordChoice) {
      case 0:
        word = words["w1"];

        break;

      case 1:
        word = words["w2"];

        break;
    }

    hint = words["hint"];

    return;
  }
}

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

class Results {
  int totalWords = 0;
  int wrongWords = 0;
  int correctWords = 0;
  bool victory = false;

  static var instance = Results();

  void reset() {
    totalWords = 0;
    wrongWords = 0;
    correctWords = 0;
    victory = false;

    return;
  }
}
