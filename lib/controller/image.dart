import 'package:flutter/widgets.dart';

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
