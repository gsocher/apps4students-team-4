import 'package:easy_study/model/Subject.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  // TODO: 03.05.2019 if we use mvvm this view shouldnt contain any field variable.
  Subject _subject;
  SubjectCard(this._subject);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _subject.title,
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                    ),
                    Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: _subject.color,
                        ))
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_subject.type.toString()),
                      Text(_subject.dueDate.toIso8601String()),
                      Text(_subject.room.toString()),
                      Text(_subject.description)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(_subject.hoursWeek.toString()),
                      Text(_subject.priority.toString())
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
