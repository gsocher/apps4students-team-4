import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SubjectCard extends StatelessWidget {
  String title;
  String type;
  String room;
  String priority;
  String description;
  Color color;
  int timeSpent;
  DateTime dueDate;
  int hoursWeek;
  double textSizeFactor;

  SubjectCard(this.title, {
    this.color=Colors.green ,
    this.hoursWeek=10,
    this.type = 'type',
    this.timeSpent=0,
    this.priority="High",
    this.description='',
    this.room='',
    this.textSizeFactor = 1.0});

  @override
  Widget build(BuildContext context) {
    return new _SubjectCardWrapper(
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new Row(
              children: [
                new Text(
                    title,
                    textScaleFactor: textSizeFactor,
                    style: Theme
                        .of(context)
                        .textTheme
                        .display2
                ),
                new Padding(
                    padding: new EdgeInsets.only(left: 5.0),
                    child: new RaisedButton(
                        color: color,
                        onPressed: null,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(1.0))
                    )
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          new Padding(
            child: new Text(title),
            padding: new EdgeInsets.only(bottom: 8.0),
          ),
        ],
      ),
    );
  }
}
class _SubjectCardWrapper extends StatelessWidget {
  final double height;
  final Widget child;

  _SubjectCardWrapper({this.height = 80.0, this.child});

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        new Expanded(
          child: new Container(
            height: height,
            child: new Card(child: child),
          ),
        ),
      ],
    );
  }
}