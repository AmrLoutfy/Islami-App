import 'package:flutter/material.dart';
import 'package:islami/Home/Quran/SurahScreen.dart';

class SurahName extends StatelessWidget {
  String name;
  int index;

  SurahName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(SurahScreen.routeName,
              arguments: SurahScreenArgs(name: name, index: index));
        },
        child: Text(
          name,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ));
  }
}
