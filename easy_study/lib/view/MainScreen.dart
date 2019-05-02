import 'package:easy_study/presenter/SubjectAdd.dart';
import 'package:easy_study/presenter/SubjectOverview.dart';
import 'package:easy_study/presenter/Map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _widget = SubjectOverview();

  Widget build(BuildContext context) {
    return new Scaffold(
        // TODO: 02.05.2019 create bottom app bar with icons for map new subject and overview.
        appBar: AppBar(
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.add, color: Colors.white),
              onPressed: () => _addPage(context, SubjectAdd()),
            ),
          ],
        ),
        body: _widget);
  }

  void _changeView(Widget widget) {
    setState(() {
      _widget = Map();
    });
  }

  static void _addPage(BuildContext context, Widget widget) {
    Navigator.pop(
        context); //remove a page from the widget stack (close navigation)
    Navigator.pushReplacement(
        //replace the top view(widget) from the stack with the new one
        context,
        MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}
