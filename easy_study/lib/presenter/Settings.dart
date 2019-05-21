import 'package:flutter/material.dart';
// import 'package:add_2_calendar/add_2_calendar.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            // TODO: 03.05.2019 what could be good settings to set?
            child: RaisedButton(
              child: Text('Export to Calendar'),
              onPressed: () {
//                final Event event = Event(
//                  title: 'Event title',
//                  description: 'Event description',
//                  location: 'Event location',
//                  startDate: DateTime(2019, 5, 24, 12, 0, 0, 0, 0),
//                  endDate: DateTime(2019, 5, 24, 13, 0, 0, 0, 0),
//                );
              //  Add2Calendar.addEvent2Cal(event);
              },
            )));
  }
}
