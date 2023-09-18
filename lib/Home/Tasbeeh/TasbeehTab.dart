import 'package:flutter/material.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class TasbeehTab extends StatefulWidget {
  @override
  State<TasbeehTab> createState() => _TasbeehTabState();
}

class _TasbeehTabState extends State<TasbeehTab> {
  int sebha = 0;
  double rotationAngle = 0;
  String tasbeeh = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          provider.IsDarkMode()
              ? Expanded(
                  child: Transform.rotate(
                      angle: rotationAngle,
                      child: Image.asset("assets/images/Group 8.png")),
                )
              : Expanded(
                  child: Transform.rotate(
                    angle: rotationAngle,
                    child: Image.asset(
                      "assets/images/Group 7.png",
                    ),
                  ),
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "عدد التسبيحات",
                    style: provider.IsDarkMode()
                        ? Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white)
                        : Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: provider.IsDarkMode()
                              ? Color(0xff141A2E)
                              : Color(0xffB7935F),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("$sebha",
                          style: provider.IsDarkMode()
                              ? Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white)
                              : Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.black)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: provider.IsDarkMode()
                                ? MaterialStatePropertyAll(Colors.yellow)
                                : MaterialStatePropertyAll(Color(0xffB7935F))),
                        onPressed: () {
                          if (sebha == 99) {
                            sebha = 0;
                          } else {
                            sebha++;
                          }
                          if (sebha <= 33) {
                            tasbeeh = "سبحان الله";
                          } else if (sebha > 33 && sebha <= 66) {
                            tasbeeh = "الحمد لله";
                          } else if (sebha > 66 && sebha <= 99) {
                            tasbeeh = "الله أكبر";
                          }
                          rotationAngle = rotationAngle + 0.15;
                          setState(() {});
                        },
                        child: Text("$tasbeeh",
                            style: provider.IsDarkMode()
                                ? Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.black)
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.white))),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
