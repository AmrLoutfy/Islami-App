import 'package:flutter/material.dart';

class HadeethTab extends StatelessWidget {
  String name = "Hadeeth number ";

  @override
  Widget build(BuildContext context) {
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
        Expanded(
          child: ListView.separated(
            itemCount: 50,
            separatorBuilder: (context, index) {
              return Divider(
                color: Theme.of(context).primaryColor,
                thickness: 3,
              );
            },
            itemBuilder: (context, index) {
              return Text("Hadeeth");
            },
          ),
        )
      ],
    );
  }
}
