import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class CustomGradientText extends StatelessWidget {
  final String content;
  final Color primaryColor;
  final Color secondaryColor;
  final double size;

  const CustomGradientText(
      {Key key,
      @required this.content,
      @required this.primaryColor,
      @required this.secondaryColor,
      @required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GradientText(
      '$content',
      style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryColor, secondaryColor]),
    );
  }
}
