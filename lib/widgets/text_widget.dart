import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  bool isTitle;
  int maxLine;
  TextWidget({required String this.text, required this.color, required this.textSize,bool this.isTitle=false,int this.maxLine=10});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
        style: TextStyle(color: color, fontSize: textSize, fontWeight: isTitle ? FontWeight.bold : FontWeight.normal));
  }
}
