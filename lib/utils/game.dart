import 'package:jogo_da_forca/data/results.dart';
import 'package:jogo_da_forca/controller/image.dart';
import 'package:jogo_da_forca/controller/panel.dart';
import 'package:jogo_da_forca/controller/hint.dart';

class Game {
  static void reset() {
    Results.instance.reset();
    ImageController.instance.reset();
    HintController.instance.reset();
    PanelController.instance.reset();

    return;
  }
}
