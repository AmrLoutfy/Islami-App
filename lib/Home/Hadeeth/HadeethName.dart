import 'package:flutter/material.dart';
import 'package:islami/Home/Hadeeth/HadeethTab.dart';

import 'HadeethScreen.dart';

class HadeethName extends StatelessWidget {
  Hadeeth hadeth;

  HadeethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(HadeethScreen.routeName, arguments: hadeth);
        },
        child: Text(
          hadeth.name,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ));
  }
}
