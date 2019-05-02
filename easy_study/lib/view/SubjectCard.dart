import 'package:easy_study/model/Subject.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {

  Subject _subject;

  SubjectCard(this._subject);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Text(_subject.title,style: TextStyle(color: Colors.green, fontSize: 20),),
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
        ));
  }
}