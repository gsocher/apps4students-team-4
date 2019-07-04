import 'package:easy_study/view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home pump widget', (tester) async {
    var home = Home();
    Widget query = MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: home),
    );
    await tester.pumpWidget(query, Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));
    await tester.pump();
  });
}
