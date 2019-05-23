import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:easy_study/database/db_helper.dart';
import 'package:easy_study/model/subject.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  List<Event> events;
  Event event;

  @override
  Widget build(BuildContext context) {
    Future<List<Subject>> subjects = DBHelper().getSubjects();
    subjects.then((value) {
      for (var subject in value) {
        event = Event(
          title: 'Event title',
          description: 'Event description',
          location: 'Event location',
          startDate: DateTime(subject.dueDate.year, subject.dueDate.month,
              subject.dueDate.day, 1, 0, 0, 0, 0),
          endDate: DateTime(subject.dueDate.year, subject.dueDate.month,
              subject.dueDate.day, 1 + subject.hoursWeek, 0, 0, 0, 0),
        );
      }
    });
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            // TODO: 03.05.2019 what could be good settings to set?
            child: RaisedButton(
              child: Text('Export to Calendar'),
              onPressed: () {
                Add2Calendar.addEvent2Cal(event);
              },
            )));
  }
}
