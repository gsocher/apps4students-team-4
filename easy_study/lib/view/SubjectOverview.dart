import 'package:easy_study/model/Subject.dart';
import 'package:easy_study/view/SubjectCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProgressSummary.dart';

class SubjectOverview extends StatelessWidget {
  // TODO: 02.05.2019 In the future we should use a database to store our subjects and modify them.
  final List<Subject> _subjects;

  SubjectOverview(this._subjects);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          ProgressSummary(_subjects),
          Expanded(child:ListView(
      children: _subjects.map((subject) => new SubjectCard(subject)).toList(),
      scrollDirection: Axis.vertical,),),
    ],
        ),
    );
  }
}
