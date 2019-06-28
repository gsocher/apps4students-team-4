import 'package:device_calendar/device_calendar.dart';
import 'package:easy_study/database/db_helper.dart';
import 'package:easy_study/model/subject.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings();

  @override
  SettingsPageState createState() {
    return new SettingsPageState();
  }
}

class SettingsPageState extends State<Settings> {
  DeviceCalendarPlugin _deviceCalendarPlugin;

  List<Calendar> calendars;

  SettingsPageState() {
    _deviceCalendarPlugin = new DeviceCalendarPlugin();
  }

  @override
  initState() {
    super.initState();
    _retrieveCalendars();
  }

  @override
  Widget build(BuildContext context) {
    List<Subject> events = new List<Subject>();
    final Future<List<Subject>> subjects = DBHelper().getSubjects();
    subjects.then((value) {
      for (var subject in value) {
        events.add(subject);
      }
    });
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            // TODO: 03.05.2019 what could be good settings to set?
            child: RaisedButton(
              child: Text('Export to Calendar'),
              onPressed: () {
                if (addEventsToCalendar(events) == true) {
                  return 0;
                }
              },
            )));
  }

  Future addEventsToCalendar(List<Subject> events) async {
    for (var subject in events) {
      final eventToCreate = new Event(calendars.elementAt(0).id);
      eventToCreate.title = subject.title;
      eventToCreate.start = subject.dueDate;
      eventToCreate.end = DateTime(subject.dueDate.year, subject.dueDate.month,
          subject.dueDate.day, subject.dueDate.hour + subject.hoursWeek);
      eventToCreate.description = subject.description;
      await _deviceCalendarPlugin.createOrUpdateEvent(eventToCreate);
    }
    return true;
  }

  void _retrieveCalendars() async {
    try {
      var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess && !permissionsGranted.data) {
        permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
        if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
          return;
        }
      }
      final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
      setState(() {
        calendars = calendarsResult?.data;
      });

      print(calendars);
    } on Exception catch (e) {
      print(e);
    }
  }
}
