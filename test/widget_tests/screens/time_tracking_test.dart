import 'package:easy_study/presenter/time_tracking.dart';
import 'package:easy_study/store/app_state.dart';
import 'package:easy_study/testhelper/test_helper.dart';
import 'package:easy_study/view/subject_overview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test functionality of time tracking', (tester) async {
    var createApp = TestHelper.createApp(TimeTracking(
      subject: TestHelper.getDummySubject(),
      analytics: FirebaseAnalytics(),
    ));
    await tester.pumpWidget(createApp);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.stop));
    await tester.pump();
  });

  testWidgets('test functionality of time tracking 2', (tester) async {
    var createApp = TestHelper.createApp(TimeTracking(
        subject: TestHelper.getDummySubject(), analytics: FirebaseAnalytics()));
    await tester.pumpWidget(createApp);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    createApp.store.dispatch(ChangeView(SubjectOverview()));
    await tester.pumpWidget(createApp);
    createApp.store.dispatch(ChangeView(TimeTracking(
      subject: TestHelper.getDummySubject(),
    )));
    await tester.pumpWidget(createApp);
    await tester.pump();
  });

  testWidgets(
      'test functionality of time tracking when started timetracking at != null',
      (tester) async {
    var subject = TestHelper.getDummySubject();
    subject.startedTimetrackingAt = "2019-07-04 17:01:03.375203";
    var createApp = TestHelper.createApp(TimeTracking(
      subject: subject,
      analytics: FirebaseAnalytics(),
    ));
    await tester.pumpWidget(createApp);
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.stop));
    await tester.pump();
  });
}
