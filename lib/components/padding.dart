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

class HorizontalPadding extends StatelessWidget {
  final double width;
  const HorizontalPadding({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
    );
  }
}
