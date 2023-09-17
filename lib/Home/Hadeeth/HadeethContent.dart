import 'package:flutter/material.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadeethContent extends StatelessWidget {
  String content;

  HadeethContent({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Text(
      content,
      style: provider.IsDarkMode()
          ? Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.yellow)
          : Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.center,
    );
  }
}
