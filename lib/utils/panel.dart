import 'package:flutter/material.dart';

class Panels {
  List<Widget> list = [];
  static var instance = Panels();

  void clear() {
    list.clear();

    return;
  }
}
