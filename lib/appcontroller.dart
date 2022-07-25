import 'package:flutter/widgets.dart';
import 'data.dart';

class ImageController extends ChangeNotifier {
  List<String> images = [
    "assets/images/0.png",
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png"
  ];

  int errors = 0;

  String get image {
    return images[errors];
  }

  void increment() {
    errors++;

    if (errors == 7) {
      errors = 0;
    }

    notifyListeners();
  }

  void reset() {
    errors = 0;

    return;
  }

  static var instance = ImageController();
}

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

class HintController extends ChangeNotifier {
  static var instance = HintController();

  bool remainsTwo = false;

  void testErrors() {
    if (ImageController.instance.errors >= 4) {
      remainsTwo = true;
      notifyListeners();
    } else {
      remainsTwo = false;
      notifyListeners();
    }

    return;
  }

  void reset() {
    remainsTwo = false;

    return;
  }
}

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
