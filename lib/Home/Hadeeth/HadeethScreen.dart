import 'package:flutter/material.dart';
import 'package:islami/Home/Hadeeth/HadeethContent.dart';
import 'package:islami/Home/Hadeeth/HadeethTab.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadeethScreen extends StatefulWidget {
  static const String routeName = "HadeethScreen";

  @override
  State<HadeethScreen> createState() => _HadeethScreenState();
}

class _HadeethScreenState extends State<HadeethScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeeth;
    var provider = Provider.of<AppConfigProvider>(context);
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
            body: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05,
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              decoration: BoxDecoration(
                  color:
                      provider.IsDarkMode() ? Color(0xff141A2E) : Colors.white,
                  borderRadius: BorderRadius.circular(30)),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return HadeethContent(content: args.content[index]);
                },
                itemCount: args.content.length,
              ),
            )),
      ],
    );
  }
}
