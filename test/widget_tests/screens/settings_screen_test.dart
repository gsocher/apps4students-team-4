import 'package:device_calendar/device_calendar.dart';
import 'package:easy_study/presenter/settings.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // TODO: 14.06.2019 not working because of channel implementation not found.
//  test('settings screen addEventsToCalendar', () async {
//    var settings = Settings();
//    var createState = settings.createState();
//    createState.calendars = [Calendar(id: "0", isReadOnly: false)];
//    List<Subject> list = new List();
//    list.add(TestHelper.getDummySubject());
//    await createState.addEventsToCalendar(list);
//  });
  MethodChannel channel =
      const MethodChannel('plugins.builttoroam.com/device_calendar');
  DeviceCalendarPlugin deviceCalendarPlugin = new DeviceCalendarPlugin();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      print("Calling channel method ${methodCall.method}");

      return null;
    });
  });

/*  test('HasPermissions_Returns_Successfully', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall == 'hasPermissions') {
        print("Has Permissions wurde aufgerufen");
        return true;
      } else if (methodCall == 'requestPermissions') {
        return true;
      } else {
        return "[{\"id\":\"1\",\"isReadOnly\":false,\"name\":\"fakeCalendarName\"}]";
      }
    });

    final result = await Settings().createState();
    expect(result.calendars, isNotEmpty);
  });*/
}
