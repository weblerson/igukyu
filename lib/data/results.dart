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
