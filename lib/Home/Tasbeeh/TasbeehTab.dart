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

  List<String> displayTexts = ['سبحان الله', 'الحمد لله', 'لا اله الا الله'];
  String tasbeeh = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              provider.IsDarkMode()
                  ? Container(
                      margin: EdgeInsets.all(10),
                      child: Expanded(
                        flex: 0,
                        child:
                            Image.asset("assets/images/dark_head_of_seb7a.png"),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.all(10),
                      child: Expanded(
                        flex: 0,
                        child: Image.asset(
                          "assets/images/head_of_seb7a.png",
                        ),
                      ),
                    ),
              provider.IsDarkMode()
                  ? Container(
                      margin: EdgeInsets.fromLTRB(0, 88, 0, 0),
                      child: Expanded(
                        flex: 0,
                        child: Transform.rotate(
                            angle: rotationAngle,
                            child: GestureDetector(
                                onTap: () {
                                  sebha++;

                                  if (sebha % 33 == 0) {
                                    if (tasbeeh == "سبحان الله") {
                                      tasbeeh = displayTexts[1];
                                    } else if (tasbeeh == displayTexts[1]) {
                                      tasbeeh = displayTexts[2];
                                    } else if (tasbeeh == displayTexts[2]) {
                                      tasbeeh = displayTexts[0];
                                    }
                                  }
                                  rotationAngle = rotationAngle + 0.15;
                                  setState(() {});
                                },
                                child: Image.asset(
                                    "assets/images/dark_body_of_seb7a.png"))),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.fromLTRB(0, 88, 0, 0),
                      child: Expanded(
                        flex: 0,
                        child: Transform.rotate(
                          angle: rotationAngle,
                          child: GestureDetector(
                            onTap: () {
                              sebha++;

                              if (sebha % 33 == 0) {
                                if (tasbeeh == "سبحان الله") {
                                  tasbeeh = displayTexts[1];
                                } else if (tasbeeh == displayTexts[1]) {
                                  tasbeeh = displayTexts[2];
                                } else if (tasbeeh == displayTexts[2]) {
                                  tasbeeh = displayTexts[0];
                                }
                              }

                              rotationAngle = rotationAngle + 0.15;
                              setState(() {});
                            },
                            child: Image.asset(
                              "assets/images/body_of_seb7a.png",
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
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
                        onPressed: () {},
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
