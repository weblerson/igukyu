import 'package:flutter/widgets.dart';

import 'package:jogo_da_forca/data/words.dart';

class PanelController extends ChangeNotifier {
  List<bool> success = [];

  static var instance = PanelController();

  void testWord(String char) {
    if (Words.instance.word.split('').contains(char)) {
      for (int i = 0; i < Words.instance.word.split('').length; i++) {
        if (Words.instance.word.split('')[i] == char) {
          success[i] = true;
        }
      }

      notifyListeners();
    }

    return;
  }

  void reset() {
    success = [];

    return;
  }
}
