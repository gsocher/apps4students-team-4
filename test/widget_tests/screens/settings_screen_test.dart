import 'package:device_calendar/device_calendar.dart';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/presenter/settings.dart';
import 'package:flutter_test/flutter_test.dart';

import '../screen_helper.dart';

void main() {
  test('settings screen addEventsToCalendar', () async {
    var settings = Settings();
    var createState = settings.createState();
    createState.calendars = [Calendar(id: "1", isReadOnly: false)];
    List<Subject> list = new List();
    list.add(ScreenHelper.getDummySubject());
    await createState.addEventsToCalendar(list);
  });
}
