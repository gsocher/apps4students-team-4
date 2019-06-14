import 'package:easy_study/presenter/subject_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('settings screen addEventsToCalendar', () async {
    var subjectAdd = SubjectAdd();
    SubjectAddState createState = subjectAdd.createState();
    var hsvColor = HSVColor.fromColor(Colors.red);
    createState.onChanged(hsvColor);
    expect(createState.color, hsvColor);
  });
}
