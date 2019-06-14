import 'package:easy_study/presenter/time_tracking.dart';
import 'package:easy_study/testhelper/test_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('show subject progress bar', (tester) async {
    var createApp = TestHelper.createApp(
        TimeTracking(subject: TestHelper.getDummySubject()));
    await tester.pumpWidget(createApp);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.stop));
    await tester.pump();
  });
}
