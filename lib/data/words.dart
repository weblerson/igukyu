import 'dart:math';

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
