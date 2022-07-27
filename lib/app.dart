import 'package:flutter/material.dart';
import 'screens/menu.dart';
import 'screens/home.dart';
import 'screens/result.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jogo da Forca",
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const Menu(),
        '/': (context) => const HomePage(),
        '/result': (context) => const ResultPage()
      },
    );
  }
}
