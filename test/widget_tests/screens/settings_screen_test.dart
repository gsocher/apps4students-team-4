import 'package:device_calendar/device_calendar.dart';
import 'package:easy_study/model/subject.dart';
import 'package:easy_study/presenter/settings.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_helper.dart';

void main() {
  test('settings screen addEventsToCalendar', () async {
    var settings = Settings();
    var createState = settings.createState();
    createState.calendars = [Calendar(id: "1", isReadOnly: false)];
    List<Subject> list = new List();
    list.add(TestHelper.getDummySubject());
    await createState.addEventsToCalendar(list);
  });
}
