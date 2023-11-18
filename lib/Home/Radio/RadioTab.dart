import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../Radios.dart';

class RadioTab extends StatelessWidget {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return FutureBuilder(
        future: getRadios(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            var radios = snapshot.data?.radios ?? [];
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50),
                  Image.asset("assets/images/radioImage.png"),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => RadioItem(
                          radioModel: radios[index],
                          audioPlayer: player,
                          provider: provider),
                      physics: PageScrollPhysics(),
                      itemCount: radios.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Future<Radios> getRadios() async {
    var url = Uri.parse('https://mp3quran.net/api/v3/radios');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return Radios.fromJson(json);
    } else {
      throw Exception('Failed to load radio');
    }
  }
}

class RadioItem extends StatelessWidget {
  RadioModel radioModel;
  AudioPlayer audioPlayer;

  RadioItem(
      {required this.radioModel,
      required this.audioPlayer,
      super.key,
      required this.provider});

  final AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Center(
            child: Text(radioModel.name ?? '',
                style: provider.IsDarkMode()
                    ? Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white, fontSize: 35)
                    : Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black, fontSize: 35)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    await audioPlayer.play(UrlSource(radioModel.url ?? ''));
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: provider.IsDarkMode()
                        ? Color(0xffFACC1D)
                        : Color(0xffB7935F),
                    size: 50,
                  )),
              SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  audioPlayer.stop();
                },
                icon: Icon(
                  Icons.stop,
                  color: provider.IsDarkMode()
                      ? Color(0xffFACC1D)
                      : Color(0xffB7935F),
                  size: 50,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
