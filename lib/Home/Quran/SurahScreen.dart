import 'package:flutter/material.dart';

class SurahScreen extends StatelessWidget {
  static const String routeName = "SurahScreen";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahScreenArgs;
    return Stack(
      children: [
        Image.asset("assets/images/background.png",
            height: double.infinity, width: double.infinity, fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ],
    );
  }
}

class SurahScreenArgs {
  String name;
  int index;

  SurahScreenArgs({required this.name, required this.index});
}
