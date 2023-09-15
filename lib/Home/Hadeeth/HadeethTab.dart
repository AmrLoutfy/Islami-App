import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home/Hadeeth/HadeethName.dart';

class HadeethTab extends StatefulWidget {
  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeeth> HadeethLines = [];

  String name = "Hadeeth number ";

  @override
  Widget build(BuildContext context) {
    if (HadeethLines.isEmpty) {
      loadHadeethFile();
    }
    return Column(
      children: [
        Center(child: Image.asset("assets/images/ahadeth_image.png")),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(
          "Hadeeth Name",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        HadeethLines.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Expanded(
                child: ListView.separated(
                  itemCount: HadeethLines.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Theme.of(context).primaryColor,
                      thickness: 3,
                    );
                  },
                  itemBuilder: (context, index) {
                    return HadeethName(name: HadeethLines[index].name);
                  },
                ),
              )
      ],
    );
  }

  void loadHadeethFile() async {
    String Hadeethcontent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeethList = Hadeethcontent.split("#\r\n");
    for (int i = 0; i < ahadeethList.length; i++) {
      print(ahadeethList[i]);
      print("----------------");
      List<String> ahadeethLines = ahadeethList[i].split("\n");
      String title = ahadeethLines[0];
      ahadeethLines.removeAt(0);
      Hadeeth hadeeth = Hadeeth(name: title, content: ahadeethLines);
      HadeethLines.add(hadeeth);
      setState(() {});
    }
  }
}

class Hadeeth {
  String name;
  List<String> content;

  Hadeeth({required this.name, required this.content});
}
