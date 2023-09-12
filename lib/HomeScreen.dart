import 'package:flutter/material.dart';
import 'package:islami/Home/Hadeeth/HadeethTab.dart';
import 'package:islami/Home/Quran/QuranTab.dart';
import 'package:islami/Home/Radio/RadioTab.dart';
import 'package:islami/Home/Tasbeeh/TasbeehTab.dart';
import 'package:islami/MainTheme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/background.png",
            height: double.infinity, width: double.infinity, fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: MainTheme.LightPrimary),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/quran.png")),
                      label: "Quran"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(
                          "assets/images/quran-quran-svgrepo-com.png")),
                      label: "Hadeeth"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                      label: "Tasbeeh"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/radio.png")),
                      label: "Radio"),
                ]),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [QuranTab(), HadeethTab(), TasbeehTab(), RadioTab()];
}
