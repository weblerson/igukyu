import 'package:flutter/widgets.dart';

import 'package:jogo_da_forca/controller/image.dart';

import 'package:jogo_da_forca/data/words.dart';

class ButtonController extends ChangeNotifier {
  final String char;
  ButtonController(this.char);

  bool? error;
  bool disabled = false;

  void testLetter() {
    if (Words.instance.word.contains(char)) {
      error = false;
    } else {
      error = true;
      ImageController.instance.increment();
    }

    disabled = true;

    notifyListeners();
  }
}
