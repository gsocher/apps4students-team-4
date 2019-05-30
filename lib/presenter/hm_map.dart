import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

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
          PhotoView(imageProvider: AssetImage('graphics/campus_lothstr.jpg'))
        ],
      ),
    ));
  }
}
