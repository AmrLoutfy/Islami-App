import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Home/Hadeeth/HadeethTab.dart';
import 'package:islami/Home/Quran/QuranTab.dart';
import 'package:islami/Home/Radio/RadioTab.dart';
import 'package:islami/Home/Settings/SettingsTab.dart';
import 'package:islami/Home/Tasbeeh/TasbeehTab.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    Color BottomNavColor =
        provider.IsDarkMode() ? Color(0xff141A2E) : Color(0xffB7935F);
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
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: BottomNavColor),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/quran.png")),
                      label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(
                          "assets/images/quran-quran-svgrepo-com.png")),
                      label: AppLocalizations.of(context)!.hadeeth),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                      label: AppLocalizations.of(context)!.tasbeeh),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/radio.png")),
                      label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings),
                ]),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadeethTab(),
    TasbeehTab(),
    RadioTab(),
    SettingsTab()
  ];
}
