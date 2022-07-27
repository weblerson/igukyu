import 'package:flutter/material.dart';

class VerticalPadding extends StatelessWidget {
  final double height;
  const VerticalPadding({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
    );
  }
}
