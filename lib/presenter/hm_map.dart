import 'package:flutter/material.dart';

class HmMap extends StatelessWidget {
  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: PageView(
        controller: controller,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('graphics/campus_lothstr.jpg'))),
          )
        ],
      ),
    ));
  }
}
