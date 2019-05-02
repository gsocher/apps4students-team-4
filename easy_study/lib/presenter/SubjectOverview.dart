
import 'package:easy_study/model/Priority.dart';
import 'package:easy_study/model/Type.dart';
import 'package:easy_study/model/Subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectOverview extends StatelessWidget {

  // TODO: 02.05.2019 Should be a list
  Subject subject = new Subject.name("title", Type.WRITTEN_EXAM, "R1.001", Priority.MINIMALISM, "description", Color.fromARGB(0, 0, 0, 0), 0, DateTime.now(), 5);

  @override
  Widget build(BuildContext context) {
    return new _SubjectCardWrapper(
      child: new Column(
        children: <Widget>[
          new Expanded(
            child: new Row(
              children: [
                new Text(
                    subject.title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .display2
                ),
                new Padding(
                    padding: new EdgeInsets.only(left: 5.0),
                    child: new RaisedButton(
                        color: subject.color,
                        onPressed: null,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(1.0))
                    )
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          new Padding(
            child: new Text(subject.title),
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