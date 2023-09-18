import 'package:flutter/material.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50),
          Image.asset("assets/images/radioImage.png"),
          Center(
            child: Text("اذاعة القرآن الكريم",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.skip_previous,
                color: provider.IsDarkMode()
                    ? Color(0xffFACC1D)
                    : Color(0xffB7935F),
                size: 50,
              ),
              SizedBox(width: 20),
              Icon(
                Icons.play_arrow,
                color: provider.IsDarkMode()
                    ? Color(0xffFACC1D)
                    : Color(0xffB7935F),
                size: 50,
              ),
              SizedBox(width: 20),
              Icon(
                Icons.skip_next,
                color: provider.IsDarkMode()
                    ? Color(0xffFACC1D)
                    : Color(0xffB7935F),
                size: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
