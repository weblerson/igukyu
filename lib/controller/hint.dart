import 'package:flutter/widgets.dart';

import 'package:jogo_da_forca/controller/image.dart';

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
