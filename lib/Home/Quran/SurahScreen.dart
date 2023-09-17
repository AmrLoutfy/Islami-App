import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home/Quran/SurahContent.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SurahScreen extends StatefulWidget {
  static const String routeName = "SurahScreen";

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SurahScreenArgs;
    var provider = Provider.of<AppConfigProvider>(context);

    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(
      children: [
        provider.IsDarkMode()
            ? Image.asset("assets/images/bg.png",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill)
            : Image.asset("assets/images/background.png",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill),
        Scaffold(
            appBar: AppBar(
              title: Text(
                args.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: verses.length == 0
                ? Center(
                    child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ))
                : Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05,
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    decoration: BoxDecoration(
                        color: provider.IsDarkMode()
                            ? Color(0xff141A2E)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SurahContent(
                          content: verses[index],
                          index: index,
                        );
                      },
                      itemCount: verses.length,
                    ),
                  )),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/quran/${index + 1}.txt");
    List<String> lines = content.split("\n");
    verses = lines;
    setState(() {});
  }
}

class SurahScreenArgs {
  String name;
  int index;

  SurahScreenArgs({required this.name, required this.index});
}
