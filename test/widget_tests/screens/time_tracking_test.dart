import 'package:easy_study/presenter/time_tracking.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/testhelper/test_helper.dart';
import 'package:easy_study/view/subject_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test functionality of time tracking', (tester) async {
    var createApp = TestHelper.createApp(
        TimeTracking(subject: TestHelper.getDummySubject()));
    await tester.pumpWidget(createApp);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.stop));
    await tester.pump();
  });

  testWidgets('test functionality of time tracking 2', (tester) async {
    var createApp = TestHelper.createApp(
        TimeTracking(subject: TestHelper.getDummySubject()));
    await tester.pumpWidget(createApp);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    createApp.store.dispatch(ChangeView(SubjectOverview()));
    await tester.pump();
    createApp.store.dispatch(ChangeView(TimeTracking(
      subject: TestHelper.getDummySubject(),
    )));
    await tester.pump();
  });
}
