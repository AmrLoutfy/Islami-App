import 'package:flutter/material.dart';

class HadeethName extends StatelessWidget {
  String name;

  HadeethName({
    required this.name,
  });

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
