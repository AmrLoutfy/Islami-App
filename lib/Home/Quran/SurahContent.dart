import 'package:flutter/material.dart';
class SurahContent extends StatelessWidget {
  String content;
  int index;
  SurahContent({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$content {${index + 1}}",
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
